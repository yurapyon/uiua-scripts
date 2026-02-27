# Lines ← ⊜(□↘¯1) ⊸(\+ ↻¯1 =@\n) ˜⊂@\n # [""...] ? ""
Lines  ← /$"_\n_"
Shrink ← ↘⊙(↘¯) ⊃⌊⁅÷2 # [a] ? ct [a]

Fade ← ⬚1˜↙÷⟜⇡               # [a] ? fade-len total-len
AR   ← ↧ ⊙⇌ ∩Fade ⊙⤙⊙∘       # [a] ? atk rel total-len
Rest ← ˜↯0                   # [a] ? sample-ct
Sin  ← ∿×π ×÷&asr⇡           # [a] ? sample-ct freq
Saw  ← -⊸¬ ◿1÷2 ×÷&asr⇡      # [a] ? sample-ct freq
Sqr  ← ±Saw                  # [a] ? sample-ct freq
Tri  ← -⊸¬ ⌵Saw              # [a] ? sample-ct freq
SPB  ← ⨪÷60                  # n ? bpm
Rise ← +×÷⟜⇡                 # [freq] ? sample-ct range min
K    ← Shrink -1 ⟜⬚0⧈(÷⊃⧻/+) # [a] ? sz [a]
Norm ← ÷⊸/↥                  # [a] ? [a]

Tempo  ← 180                                       # n ?
Base   ← 261                                       # n ?
Qtr    ← ⁅ ×&asr ×0.25 ×SPB Tempo                  # n ? n
Note   ← ×Base ˜ⁿ2÷12                              # n ? n
Chord  ← × AR Qtr5 Qtr2 ⊸⧻ ÷⊃⧻/+ ≡(Tri⊙Note)       # [a] ? sample-ct [notes]
Single ← × AR Qtr0.25 Qtr1 ⊸⧻ Tri ⊙Note            # [a] ? sample-ct note
Kick   ← × AR 400 400 ⊸⧻ Tri ⟜(⇌Rise) Qtr2 440 330 # [a] ?
Snare  ← × ˙× AR 100 7500 ⊸⧻ K 5 -⊸¬ gen Qtr2 0    # [a] ?

S ← × ˙× AR Qtr0.1 Qtr1.9 ⊸⧻ Sin ⊙Note # [a] ? sample-ct note

Note   ← ⬚0⨂"c d ef g a b"¯⌵
Sharp  ← ≍@#
Octave ← ×12-3⬚3⋕
ParseNote ← |1 ⍣(
  0 °⊟₀
| Note °⊟₁
| +⊓(Note|Octave) °⊟₂
| ++⊓(Note|Sharp|Octave) °⊟₃
| ParseNote⊂⊃(↙2|⊣)
)
NoteTrack ← (
  ⍚(⊜ParseNote ⊸≠@\s) °Lines
  ≡(⍣(Rest Qtr2 °[]|Chord Qtr2)°□)
  Norm /◇⊂
)

# ToNotes Track(
# $ c3 g3 e3 c4
# $ 
# $ e3
# $ 
# $ g3
# $ c#3
# $ 
# $ c3
# $ c#3 f3 c#4
# $     g#3
# $ f3
# $ 
# $ g#3
# $ d3
# $ 
# $ g3
# )

NoteTrack(
  $ c4 c3
  $ c#4
  $ d4 d3
  $ 
  $ a3 a2
  $ 
  $ d4 d3
  $ c#4 c#3
  $ c4 c3
  $ c#4
  $ d4 d3
  $ 
  $ a4 a3
  $ 
  $ d4 d3
  $ c#4 c#3
)
÷2 ⊂⟜∘ ⊂⟜∘

&ap
&exit []

{
  (
    {
      Kick
      Rest Qtr1
      ÷2 Kick
      Rest Qtr1
      ÷2 Kick
      ×0.7 Snare
      ×0.2 Snare
      Rest Qtr4
      # Rest Qtr1
    }

    ÷2 /◇⊂ ⊂⟜∘ ⊂⟜∘
  )

  (
    {
      Single Qtr2 -12 0
      Single Qtr2 -12 4
      # Single Qtr2 -12 7
      # Single Qtr2 -12 4
      Single Qtr4 -12 7

      Single Qtr2 -12 ¯ 1
      Single Qtr2 -12 4
      Single Qtr2 -12 10
      Single Qtr2 -12 5
      # Single Qtr4 -12 10
    }
    ⊂⟜∘

    {
      Single Qtr4 -12 0
      # Single Qtr4 -12 7
      Single Qtr2 -12 7
      Single Qtr2 -12 4

      Single Qtr4 -12 ¯ 1
      Single Qtr4 -12 10

      # Single Qtr2 -12 10
      # Single Qtr2 -12 5
    }
    ⊂⟜∘

    ˜⊂

    ÷2 /◇⊂
  )

  (
    {
      Chord Qtr8.5 [0 4 7 10 ¯12]
      Chord Qtr8 [0 5 7 10 ¯12]
      Chord Qtr7.25 [0 4 7 10 ¯12]
      Chord Qtr8.25 [¯1 5 7 10 ¯12]

      Chord Qtr8.5 [0 4 7 9 ¯7]
      Chord Qtr8 [0 5 7 9 ¯7]
      Chord Qtr7.25 [0 4 7 9 ¯7]
      Chord Qtr8.25 [¯1 3 7 9 ¯7]
    }
    /◇⊂
  )
}
⊂⟜∘ /◇(⬚0+)

Norm

&ap
&exit []

?
audio "wav" &asr
&fwa "test.wav"
