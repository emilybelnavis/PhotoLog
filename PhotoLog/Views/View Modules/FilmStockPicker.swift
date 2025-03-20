//
//  FilmStockPicker.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-02-12.
//

import Foundation
import SwiftUI
import SwiftData

public struct FilmStockPicker<SelectionValue: Hashable, Content: View>: View {

    private let title: LocalizedStringKey
    private let selection: Binding<SelectionValue>
    private let content: Content

    init(
        _ title: LocalizedStringKey,
        selection: Binding<SelectionValue>,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.selection = selection
        self.content = content()
    }

    public var body: some View {
        NavigationLink {
            List {
                content
            }
            .navigationTitle(title)
        } label: {
            Text(title)
                .font(.footnote.weight(.medium))
                .foregroundStyle(.secondary)

            Text(verbatim: String(describing: selection.wrappedValue))
        }
    }
}

private struct FilmStockPickerOptions<Value: Hashable>: _VariadicView.MultiViewRoot {
    private let selectedValue: Binding<Value>

    init(selectedValue: Binding<Value>) {
        self.selectedValue = selectedValue
    }

    @ViewBuilder
    func body(children: _VariadicView.Children) -> some View {
        Section {
            ForEach(children) { child in
                FilmStockPickerOption(
                    selectedValue: selectedValue,
                    value: child[CustomTagValueTraitKey<Value>.self]
                ) {
                    child
                }
            }
        }
    }
}
private struct FilmStockPickerOption<Content: View, Value: Hashable>: View {
    @Environment(\.dismiss) private var dismiss

    private let selectedValue: Binding<Value>
    private let value: Value?
    private let content: Content

    init(
        selectedValue: Binding<Value>,
        value: CustomTagValueTraitKey<Value>.Value,
        @ViewBuilder _ content: () -> Content
    ) {
        self.selectedValue = selectedValue
        self.value = if case .tagged(let tag) = value {
            tag
        } else {
            nil
        }
        self.content = content()
    }

    var body: some View {
        Button(
            action: {
                if let value {
                    selectedValue.wrappedValue = value
                }
                dismiss()
            },
            label: {
                HStack {
                    content
                        .tint(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if isSelected {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.tint)
                            .font(.body.weight(.semibold))
                            .accessibilityHidden(true)
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits(isSelected ? .isSelected : [])
            }
        )
    }

    private var isSelected: Bool {
        selectedValue.wrappedValue == value
    }
}

extension View {
  public func pickerTag<V: Hashable>(_ tag: V) -> some View {
    _trait(CustomTagValueTraitKey<V>.self, .tagged(tag))
  }
}

private struct CustomTagValueTraitKey<V: Hashable>: _ViewTraitKey {
  enum Value {
    case untagged
    case tagged(V)
  }

  static var defaultValue: CustomTagValueTraitKey<V>.Value {
    .untagged
  }
}
