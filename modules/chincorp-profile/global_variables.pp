# Global Variables
# ================
#
# The purpose of the class is to bring together varables that need to be stored in hiera
# and be accesed by multiple profiles. They just have to inherit this class and they will
# have access to all of it's variables. This allows classes to share variables without confusing
# parameters and without breaking our hiera naming conventions.
class chincorp-profile::global_variables {
  #$temp_dir = hiera('profile::global_variables::temp_dir','C:\Temp\\')
  #$package_source = hiera('profile::global_variables::package_source','C:\Temp\\')
  #$chocolatey_feed = hiera('profile::global_variables::chocolatey_feed','https://packages.anzgcis.com/chocolatey/nuget')
  #$gcis_tools_dir = hiera('profile::global_variables::gcis_tools_dir',"c:\\gcis\\tools")

  # $temp_dir = hiera('profile::global_variables::temp_dir')
  # $package_source = hiera('profile::global_variables::package_source')
  # $chocolatey_feed = hiera('profile::global_variables::chocolatey_feed')
}