# Waller - A Wallpaper App Made With Flutter 🔥🔥🔥🔥🔥

![](https://lh3.googleusercontent.com/17EIoDmxGiLIuqS0fQHVpUwsCYVydtTNqnpXhzU6v9HxNiavl1yXWqEZ8KDF9833nfc)

### Waller Provides Best Quality Wallpapers for your phone.


### Information about the app:

```
Waller provides:
Recent Wallpaper- The Most recent wallpapers.
Trending Wallpaper- Most popular wallpaper.
Featured Wallpaper - Uploaded by famous Artists.
Random Wallpaper - Random wallpaper shown from random collections.

Waller have various Categories:
Art
Gaming
Sports,
Movies,
Nature,
Abstract etc.

You Can Download Any Wallpaper in One Click.

No -Ads for Lifetime 
```

## Screenshot 📱
![](https://lh3.googleusercontent.com/anDnKywD8T5VrPuLXM_BdCgsTIo-TOmIF9uY8ZP9TpHSGWjUjKqi5wWrN_jy0HhNRsf2=w200-h400)
![](https://lh3.googleusercontent.com/J79r4RW3TIYcKOykVxNjSRzZ0xUEOPNPDTwBqi28kg6rYusld3ar3-fS6PU3ZaEtafg=w200-h400)
![](https://lh3.googleusercontent.com/T5OTNF9IFT8WB3Kq6S-vXBTwRdUQRv5BvtNfhosW3m49JcSa14q7MiLMaAnYXPYhvA=w200-h400)
![](https://lh3.googleusercontent.com/dnWP-uCC1y-Z3u2JdBHhq2u0taIBuDuGfIOnCRwHswM9AidhGxZb7LW_pb6ktxhq3yY7=w200-h400)
![](https://lh3.googleusercontent.com/Y0uaHSh6srxmUX5O7ZGRljggF7215lflnlHvh8QslLQGqtg-5_ml1kENjYOnyP77NA=w200-h400)

### Show some ❤️ and star the repo to support the project
![](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)

# Building the project 📽

Missing Key.Properties file ❌❌

If you try to build the project straight away, you'll get an error complaining that a key.properties file is missing and Exit 🚪

You have to create your own key and run it (You can follow following steps😉).

1. Open \android\app\build.gradle file and paste following lines without comments.
```
//keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

signingConfigs {
// release {
// keyAlias keystoreProperties['keyAlias']
// keyPassword keystoreProperties['keyPassword']
// storeFile file(keystoreProperties['storeFile'])
// storePassword keystoreProperties['storePassword']
// }
}
buildTypes {
// release {
// signingConfig signingConfigs.release
// }
}
```

2.Open \android\local.properties and add -
```
flutter.versionName=1.0.0
flutter.versionCode=1
flutter.buildMode=release
```


Or you can follow from the Official Doc.https://flutter.dev/docs/deployment/android.


<p>
<a href="https://play.google.com/store/apps/details?id=com.NakumsDtech.waller"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" alt="Waller"></a>
</p>

❤ Found this project useful?
If you found this project useful, then please consider giving it a ⭐ on Github and sharing it with your friends via social media.

### LinkedIn Profile
<p>
<a href="https://www.linkedin.com/in/dhruv-nakum-4b1054176/"><img src="https://img.icons8.com/ios-filled/2x/linkedin.png" alt="LinkedIn"></a>
</p>
