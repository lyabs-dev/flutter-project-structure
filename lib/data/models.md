# App models

## Settings
_SettingsItem - SettingsProvider - SettingsRepository_

### Item

**Properties**
* lang code (string)
* is dark mode (bool)

**Methods**
* toMap
* fromMap

### Provider - Repository
* getSettings
* setSettings