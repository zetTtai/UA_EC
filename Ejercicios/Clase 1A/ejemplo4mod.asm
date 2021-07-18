li $s1, 1
mtc1 $s1, $f1
cvt.s.w $f1, $f1

sub.s $f0, $f0, $f0

div.s $f1, $f1, $f0 #n/0 --> Infinity
div.s $f0, $f0, $f0 #0/0 --> NaN
