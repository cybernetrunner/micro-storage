include Makefile.vars
include Makefile.common
include Makefile.kind
include Makefile.remotedebug

# to override a target from Makefile.common just redefine the target.
# you can also chain the original atlas target by adding
# -atlas to the dependency of the redefined target