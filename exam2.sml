(* Question 1 *)

print "------------Question 1------------\n\n";

fun isSuffixOf([], []) = true
  | isSuffixOf(xs, []) = false 
  | isSuffixOf([], ys) = true
  | isSuffixOf(x::xs, y::ys) = 
        if (x = y) then
            isSuffixOf(xs, ys)
        else
            isSuffixOf(x::xs, ys);


isSuffixOf([1, 2, 3], [1, 2, 3]);
isSuffixOf([2, 3], [1, 2, 3]);
isSuffixOf([3], [1 ,2 ,3]);
isSuffixOf([], [1 ,2 ,3]);
isSuffixOf([3 ,2], [1 ,2 ,3]);

print "\n------------Question 2------------\n\n";

fun isFound(x, []) = false
  | isFound(x, y::ys) = 
    if x = y then true else isFound(x, ys);

fun isEquivalentTo([], []) = true
  | isEquivalentTo([], ys) = true
  | isEquivalentTo(xs, []) = false
  | isEquivalentTo(x::xs, y::ys) = 
        if isFound(x, ys) then 
            isEquivalentTo(xs, y::ys)
        else
            false;


isEquivalentTo([1 ,2 ,3], [1 ,2 ,3]); (* true *)
isEquivalentTo([1 ,2 ,3], [2 ,1 ,3]); (* true *)
isEquivalentTo([1 ,2 ,3], [3 ,2 ,1]); (* true *)
isEquivalentTo([1 ,2 ,3], [4 ,2 ,1]); (* false *)

print "\n------------Question 3------------\n\n";

fun sumPairs([]) = (0, 0)
  | sumPairs([(x, y)]) = (x, y)
  | sumPairs((x, y)::list) = 
        let 
            val (a, b) = sumPairs(list)
        in 
            (x+a, y+b)
        end;

sumPairs([]);
sumPairs([ (1 ,5) ]);
sumPairs([ (1 ,5) , (2 ,6)]);
sumPairs([ (1 ,5) , (2 ,6) , (3 ,9) ]);

print "\n------------Question 4------------\n\n";

fun merge(xs, []) = xs
  | merge([], ys) = ys
  | merge(x::xs, y::ys) = 
    if (x < y) then
        x::merge(xs, y::ys)
    else y::merge(x::xs, ys);

merge([1 ,3 ,5], [2 ,4 ,6]);   (* returns [1 ,2 ,3 ,4 ,5 ,6] *)
merge([1 ,2 ,5], [3 ,4 ,6]);   (* returns [1 ,2 ,3 ,4 ,5 ,6] *)
merge([1], [2 ,4 ,6]);             (* returns [1 ,2 ,4 ,6] *)

fun mergeLists([]) = []
  | mergeLists([xs]) = xs
  | mergeLists(xs::xss) = 
    merge(xs, mergeLists(xss));

mergeLists([ [1 ,3 ,5] , [2 ,4 ,6] ]);                     (* result = [1 ,2 ,3 ,4 ,5 ,6] *)
mergeLists([ [1 ,5] , [2 ,4 ,6] , [3 ,10] , [] ]);  (* result = [1 ,2 ,3 ,4 ,5 ,6 ,10] *)
