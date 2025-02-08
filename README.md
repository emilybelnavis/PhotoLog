# Photo Log

[![wakatime](https://wakatime.com/badge/user/25fa80f6-0c6c-4e77-ad2c-9b37c3d81799/project/ee6f3ada-fe6b-46f2-a3d1-7141754e5bab.svg?style=flat-square)](https://wakatime.com/badge/user/25fa80f6-0c6c-4e77-ad2c-9b37c3d81799/project/ee6f3ada-fe6b-46f2-a3d1-7141754e5bab)
![Static Badge](https://img.shields.io/badge/6.0-orange?style=flat-square&logo=swift&label=Swift%20Version)
![Static Badge](https://img.shields.io/badge/iOS_18.0+_|_macOS_14.0+-orange?style=flat-square&logo=apple&label=Supported%20Platforms)

A digital log book for the analog film world.

## Notes

This app has some values that need to be pre-populated into the swift database at compile time. There are scripts inside of `utils/` that will generate updated versions of these data files. Generated data files will be stored at `PhotoLog/Data`.

### Film Stock Info

To generate the `filmStocks.json` data file, ensure that a copy of `filmStocks.csv` exists inside of `utils/data` and then run `swift genFilmStockInfo.swift`