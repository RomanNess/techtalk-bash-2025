hello() {
  echo "Hello $1!"
}

@test "hello returns correct output" {
  run hello "Techtalk"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello Techtalk!" ]
}

@test "intentional failure" {
  run hello "Techtalk"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello World!" ]
}
