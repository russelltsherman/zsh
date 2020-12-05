
# Union of two or more arrays
# USAGE:
#   arr::union [arr1[ arr2[ ...]]]
# EXAMPLE:
#   $ arr1=('a' 'b' 'c')
#   $ arr2=('b' 'c' 'd')
#   $ arr3=('c' 'd' 'e')
#   $ arr::union $arr1 $arr2 $arr3
#   > a b c d e
arr::union() {
  typeset -U sections=("$@")
  echo $sections
}
