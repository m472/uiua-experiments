&fras "iris_data.csv"

# Train test split
r ← 0.8

# Number of Neighbours
k ← 3

# read csv data
⍜⍉⊂∵parse≡(⊐↙4)∶⊙∶∶⊏⊙∶⊝.⊛.∺⊏¯1.≡(⊐⊜□≠@,.)⊜□ ≠@\n.▽≠@ .

# Shuffle and Train/Test Split, after this Xy test Xy train is on top of stack
∩'⊔⊏1∶0.⊜□+1≤⇡∶⌈×r.⧻.⊏⍏[⍥⚂⧻].

# predict
⊟≡(⊡⊗0⍖/+⊞=..)⊏⊙(∶∩(⊢⇌⍉))≡(↙k⍏) √≑1/+⍘√⊠-∩(⍜⍉(↙-1⧻.)),,

# calculate confusion matrix
↯⊂.∶/+⍉≡/⊂≐⌕/⊂⊞⊂.⇡,∶⧻⊝♭.⍉

# show confusion matrix
⊙∶/↥∵⧻.∶⊂{""}∶⍜⍉⊂,∵'□$" _"
⍜∶⊙∶⍉/⊐⊂∵(□⊐⍉)≡(□∺⊂⍜∶⊔[⍥@ ]-1⊡0∶⊡1.) ⍉⊟∶⊙.≡□⬚@ ∵⊔∶+1                   # format lower label
≡&p ⍥⊂2∶/⊂[⍥" "]⧻∶⍉./⊐⊂∵(□⊐⍉)≡(□≡/⊐⊂⍉⊟≡(□/⊂[⍥" "])-∵⧻, ⊡ 0 ∶↘1.) ⍉⊂∵□∶ # format upper label
