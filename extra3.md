## Difference between AAR, JAR, DEX, APK in Android?
- JAR (Java Archive)
- JAR is a package file format designed for distribution of Java application on its platform. It contains compiled Java class files + some more files like MANIFEST. Basically it is just an ZIP archive with some restrictions.

- DEX (Dalvik Executable)
- DEX is binary file format, so it is compiled. We could say, that .dex file is for DVM (Dalvik Virtual Machine) something like .class files for JVM.

- DEX file format is really generated from java CLASS files by dex compiler from Android SDK. This compiler translates JVM bytecode to DVM bytecode and put all class files to one dex file.

- APK (Android Application Package)
- APK is file format designed for distributing Android application on its platform. It has some similarities with JAR format. Again it is simply just a ZIP archive, but APK files have pre-defined specific structure. For example, it always must contains file named AndroidManifest.xml and many more. Also this package aggregates compiled classes in dex format.

- AAR
- AAR is the binary distribution of an Android Library Project. It has similar structure as APK.

## what is the build tool for ios?
- The Xcode build system manages the tools that transform your code and resource files into a finished app. When you tell Xcode to build your project, the build system analyzes your files and uses your project settings to assemble the set of tasks to perform.
- iOS (formerly iPhone OS) is a mobile operating system based on macOS and on components of the Mach microkernel and FreeBSD, a Unix-like operating system, developed by Apple Inc. exclusively for its smartphones. It was unveiled in January 2007 for the first-generation iPhone, launched in June 2007.
- Xcode. Apple has introduced Xcode, a tool for creating Swift applications for iOS devices. It is the first choice for new developers to create applications for the Mac, iPad, iPhone, Apple Watch, and Apple TV.

## Compare between App bundles in android and ios?
- An Android App Bundle is a publishing format that includes all your app’s compiled code and resources, and defers APK generation and signing to Google Play.

- Google Play uses your app bundle to generate and serve optimized APKs for each device configuration, so only the code and resources that are needed for a specific device are downloaded to run your app. You no longer have to build, sign, and manage multiple APKs to optimize support for different devices, and users get smaller, more-optimized downloads.

- Android App Bundle is the Android application publishing file format. The App Bundle must include the application's compiled code and resources, which allows for the signing and generation of APK files to be deferred to the app store, reducing the initial download size of the app.

- In Ios, You can have up to 10 apps in a single app bundle. Each app bundle has its own dedicated product page, icon, and title which is indexed on several keywords (E.g., your brand name). All the apps included in the app bundle should be either paid or free with a subscription.
- Apple uses bundles to represent apps, frameworks, plug-ins, and many other specific types of content. Bundles organize their contained resources into well-defined subdirectories, and bundle structures vary depending on the platform and the type of the bundle. By using a bundle object, you can access a bundle's resources without knowing the structure of the bundle. The bundle object provides a single interface for locating items, taking into account the bundle structure, user preferences, available localizations, and other relevant factors.

- Any executable can use a bundle object to locate resources, either inside an app’s bundle or in a known bundle located elsewhere. You don't use a bundle object to locate files in a container directory or in other parts of the file system. 
