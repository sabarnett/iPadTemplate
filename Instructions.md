#  Template App

This app is intended to provide a pre-built template that I can use when I want to create
a new iPad app. It contains all of the standard boilerplate content that has to be created
for any master/detail app along with some basic functionality such as a settings
popup and an about box.

## Structure

There are a few top level folders...

### Data

Contains data models and shared data such as the master view model.

* Constants.swift should be reviewed to change the home page for the product.
* SharedState.swift is the top most view model. This will be passed via the environment from the app entry point.

### Enums

A place to centralise your enums. It contains a single file ```DisplayMode.swift``` that supports the user changing between light and dark mode.

### Extensions

A place to consolidate extensions. There is a single file that provides extensions to the bundle to get useful information for the about window.

### Screens

Screens is where the main views of the app are kept. There are sub folders for:

* HomeView - the view that is called from the App This is your starter view for the entire app.
* SidebarView - defines the content of the sidebar
* DetailView - defines the detail view for any selected items
* LaunchView - defines the logic for displaying the opening screen. This will adjust the image to be displayed based on whether the device is in landscape or portrait orientation.

### Views

Views contains any view that is not a main app view. This is where we define

* The About view
* Settings
* A utility view for styling toolbar items

### Structure description

The structure of the app is very simple. The iPadTemplateApp.app file starts out
displaying the LaunchScreen.swift file to show the opening image. The LaunchScreen 
will auto-select which image is shown based on whether the screen width is greater
than or less thasn the screen height.

After a short period of time (user configurable) the opening image is closed and
the HomeView is displayed. It is  passed an instance of SharedState via the
environment.

HomeView is a NavigationSplitView that displays the SidebarView and the DetailView.

Icons are provided via the HomeView to display settings, via the SettingsView, and
information on the app, via the AboutView.

SettingsView contains the app settings. The template comes with two settings grouped
under the General Settings banner:

* Display mode to change the app betweek Light Mode, Dark Mode and System Mode 
which mirrors the current system setting. In System Mode the app will change
between light and dark mode automatically.

* Launch screen settings control whether the launch screen is shown or not and,
if shows, for how long.

This is all defined in the GeneralSettingsView, which can be used as a template for
creating your own settings.

## The App

The app entry point (iPadTemplateApp.swift) is responsible for

* Displaying the launch screen
* Creating the SharedState
* Displaying the ```HomeView``` and passing it the SharedState

## Customisation

You will want to do some customisation of the app once it has been created. 

You should review these files as a minimum:

* Data/Constants.swift
* Extensions/Bundle_Extensions.swift

You will also want to replace these assets with your own versions. They are the images used in the launch screen and the image for the AboutView:

* LaunchLandscape
* LaunchPortrait
* AppLogo

There is also a file called ```AppIcon.Icon``` which is the icon for the app. This is an Icon Designer file that you will need to customise for your specific needs.

You should review the copyright setting and enter your own copyright. You get to this through:

```
Project Settings
    +-- Target
           +-- Build Settings
           	      +--- info.plist Values
                        +-- Copyight (Human Readable)
```

There is default text in there for the template, but it should be reviewed or replaced.

Everything else is just code... have fun

## DisplayMode

One of the key features is the ability to switch between light/dark and system modes. It
is fairly simple, but involves code in several places.

The available modes is defined n the DisplayMode.swift file. This contains the enum
that we use internally and the interface between that and the values that are expected
using the `.preferredColorScheme` modifier. 

The state of the app is set in the iPatTemplateApp.app file when the HomeView is
created and launched. This reads the value from AppSettings used to configure the
user requested display mode. Setting at this level sets the colour scheme for the
entire app. 

This includes the sheets but has a small problem. Once the SettingsView has been
displayed, changing the display mode will not be reflected by the SettingsView until
it is closed and reopened. To deal with this, we need to set the preferredColorScheme
in the SettingsView and monitor for changes of the AppSetting for display mode.

The combination of these actions ensures that the SettingsView keeps in step with the
changing Display Mode. 
