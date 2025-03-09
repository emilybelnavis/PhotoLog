# Photo Log

[![wakatime](https://wakatime.com/badge/user/25fa80f6-0c6c-4e77-ad2c-9b37c3d81799/project/018e77ba-b8d7-4765-93c3-d36adfcc240a.svg?style=flat-square)](https://wakatime.com/badge/user/25fa80f6-0c6c-4e77-ad2c-9b37c3d81799/project/018e77ba-b8d7-4765-93c3-d36adfcc240a)
![Static Badge](https://img.shields.io/badge/6.0-orange?style=flat-square&logo=swift&label=Swift%20Version)
![Static Badge](https://img.shields.io/badge/iOS_18.0+_|_macOS_15.0+-orange?style=flat-square&logo=apple&label=Supported%20Platforms)

A digital log book for the analog film world.

## Notes

This app has some values that need to be pre-populated into the swift database at compile time. There are scripts inside of `utils/` that will generate updated versions of these data files. Generated data files will be stored at `PhotoLog/Data`.

### Film Stock Info

To generate the `filmStocks.json` data file, ensure that a copy of `filmStocks.csv` exists inside of `utils/data` and then run `swift genFilmStockInfo.swift`

### To Do List

- [ ] Add a few more film stocks
- [ ] Add a camera library
- [ ] Implement the actual photo logging
- [ ] Make the UI look pretty