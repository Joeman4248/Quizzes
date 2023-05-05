(* Question 1 *)

fun isSuffixOf([], []) = true
  | isSuffixOf(xs, []) = false 
  | isSuffixOf([], ys) = false
  | isSuffixOf(x::xs, y::ys) = 
        if (x = y) then
            true andalso isSuffixOf(xs, ys)
        else
            isSuffixOf(x::xs, ys);
    

isSuffixOf([1, 2, 3], [1, 2, 3]);
isSuffixOf([2, 3], [1, 2, 3]);
isSuffixOf([3], [1 ,2 ,3]);
isSuffixOf([], [1 ,2 ,3]);
isSuffixOf([3 ,2], [1 ,2 ,3]);
isSuffixOf([2], [1 ,2 ,3]);
