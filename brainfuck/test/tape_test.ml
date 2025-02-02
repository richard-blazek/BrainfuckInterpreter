open Brainfuck.Tape

let check expected t =
  Alcotest.check Alcotest.int "int should be equal" expected (get t)

let test_add_sub () =
  check 0 empty;
  check 1 (add empty);
  check 2 (add (add empty));
  check 3 (add (add (add empty)));
  check 255 (sub empty);
  check 254 (sub (sub empty));
  check 0 (add (sub empty));
  check 0 (sub (add empty))

let test_right_left () =
  check 0 (right empty);
  check 0 (right (add empty));
  check 1 (add (right empty));
  check 1 (add (right (add empty)));
  check 0 (left empty);
  check 0 (left (add empty));
  check 1 (add (left empty));
  check 1 (add (left (add empty)));
  check 1 (left (right (add empty)));
  check 254 (right (left (sub (sub (right empty)))));
  check 0 (right (right (add (sub (left (right (add (left (left empty)))))))));
  check 1 (left (left (right (right (add (sub (left (right (add (left (left empty)))))))))))

let test_get_put () =
  check 7 (put 7 empty);
  check 0 (put 256 (right empty));
  check 0 (add (put 255 (right empty)));
  check 0 (sub (put 257 (right empty)))
