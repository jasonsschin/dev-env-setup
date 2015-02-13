# WinConfig - Set Windows Explorer Options
define winconfig::exploreroptions(
  $ensure,
  $option
) {

  case $ensure {
    'present','enabled': { $toggle = 1 }
    'absent','disabled': { $toggle = 0 }
    default: { fail('You must specify a valid ensure status...') }
  }

  case $option {
    'showhiddenfilesfoldersdrives': { $value_name = 'Hidden' }
    'hidefileext': {$value_name = 'HideFileExt'}
    'showsuperhidden': {$value_name = 'ShowSuperHidden'}
    'fullpath': {$value_name = 'FullPath'}
  }

  case $option {
    'fullpath': {$key_name = 'CabinetState'}
    default: {$key_name = 'Advanced'}
  }

  exec { "$title/.$value_name/set-itemproperty":
    command   => "Set-ItemProperty  HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\$key_name $value_name $toggle",
    provider  => powershell,
    logoutput => true,
    notify => Exec["$title/.$value_name/stop-process"]
  }

  exec { "$title/.$value_name/stop-process":
    command   => 'Stop-Process -ProcessName explorer',
    provider  => powershell,
    logoutput => true
  }


}