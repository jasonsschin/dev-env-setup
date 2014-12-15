# Global Variables
# ================
#
# The purpose of the class is to bring together varables that need to be stored in hiera
# and be accesed by multiple profiles. They just have to inherit this class and they will
# have access to all of it's variables. This allows classes to share variables without confusing
# parameters and without breaking our hiera naming conventions.
class chincorp-profile::global_variables {

}