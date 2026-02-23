Fade ← ⬚1˜↙÷⟜⇡            # ? fade-len total-len
AR   ← ↧ ⊙⇌ ∩Fade ⊙⤙⊙∘    # ? atk rel total-len
Rest ← ˜↯0                # ? sample-ct
Sin  ← ∿×π × ÷&asr⇡       # ? sample-ct freq
Saw  ← -⊸¬ -⊸⌊÷2 × ÷&asr⇡ # ? sample-ct freq
Sqr  ← ±Saw               # ? sample-ct freq
Tri  ← -⊸¬ ⌵Saw           # ? sample-ct freq
SPB  ← ⨪÷60               # ? bpm
Rise ← ⟜(+×÷⟜⇡)           # sample-ct [freq] ? sample-ct range min

Tempo ← 180
Base  ← 440
Qtr   ← ⁅ ×&asr ×0.25 ×SPB Tempo
Note  ← ×Base ˜ⁿ2÷12

Chord  ← × AR Qtr5 Qtr2 ⊸⧻ ˜÷/+ ⟜⧻ ≡(Tri⊙Note) # ? sample-ct [notes]
Single ← × AR Qtr0.25 Qtr1 ⊸⧻ Tri ⊙Note        # ? sample-ct note
Kick   ← × AR 100 100 ⊸⧻ Tri ⊙⇌Rise Qtr2 440 220
Snare  ← × ˙× AR 100 7500 ⊸⧻ -⊸¬ gen Qtr2 0

# &exit []
{
  (
    {
      Kick
      Rest Qtr1
      ÷2 Kick
      Rest Qtr1
      ÷2 Kick
      ×0.7 Snare
      Rest Qtr4
      Rest Qtr2
      # ÷2 Kick
    }
    ÷8 /◇⊂ ⊂⟜∘ ⊂⟜∘
  )

  (
    {
      Single Qtr2 -12 0
      Single Qtr2 -12 4
      Single Qtr2 -12 7
      Single Qtr2 -12 4

      Single Qtr2 -12 ¯ 1
      Single Qtr2 -12 4
      Single Qtr2 -12 10
      Single Qtr2 -12 5
    }
    ÷8 /◇⊂ ⊂⟜∘ ⊂⟜∘
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
    ÷3.75 /◇⊂
    # ◌
  )
}
÷2 ⊂⟜∘ /◇(⬚0+)

&ap
&exit []

?
audio "wav" &asr
&fwa "test.wav"
