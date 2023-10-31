$ 30373
$ 25512
$ 65332
$ 33549
$ 35390

# split rows and separate chars
-@0⊜∘≠@\n.

IsVisible ← (
  # add padding to make sure the first row
  # of trees is always visible
  ~

  # search for trees larger than the one before
  ⍜⍉≡(∸/≠⍉◫2⊛) \↥

  # remove padding
  ↘1
)

# check visibility from all sides
∶IsVisible .
∶⍜⇌IsVisible .
∶⍜⍉IsVisible .
∶⍜'⇌⍉ IsVisible .
;

# logical or between visibilities from all sides
≥1+++

# count visible trees
/+ ♭
