$a = {z => 1, y => 'test', x => [1,2,3]}
$b = {y => 42, x => 'testing'}
$c = { y => 'test', x => [1,2,3] }
$o = hash_intersection($a,$b)
if keys($o) == keys($c) and values($o) == values($c) {
  notify { 'test 1 output correct': }
}


$g = {z => 1, y => 'test', x => [1,2,3]}
$h = ['y', 'x']
$i = { y => 'test', x => [1,2,3] }
$p = hash_intersection($g,$h)
if keys($p) == keys($i) and values($p) == values($i) {
  notify { 'test 2 output correct': }
}
