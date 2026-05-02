tmp() {
  if [ -z "$1" ]; then
    echo "Usage: tmp <filename>"
    return 1
  fi

  local filename="$1.cpp"

  if [ -e "$filename" ]; then
    echo "File already exists: $filename"
    return 1
  fi

  cat > "$filename" <<EOF
/**
 *    author: wires
 *    site:   wrs.sh
**/

#include <bits/stdc++.h> 
using namespace std;

int main() {
  ios::sync_with_stdio(false); 
  cin.tie(nullptr);
  return 0;
}
EOF

  echo "created $filename"
}

function compile {
  g++ -std=c++11 -O2 -Wall -Wextra -Wshadow $1 -o "${1%.cpp}"
}
