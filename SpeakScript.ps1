#makes your computer speak
Add-Type -AssemblyName System.Speech
$SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
$SpeechSynth.Speak("
We've been twying to weach you concewning youw vehicwe's extended wawwanty. You shouwd've weceived a notice in the maiw about youw caw's extended wawwanty ewigibiwity. Since we've not gotten wesponse, we'we giving you a finaw couwtesy caww befowe we cwose out youw fiwe. Pwess 2 to be wemoved and pwaced on ouw do-not-caww wist. To speak to someone about possibwy extending ow weinstating youw vehicwe's wawwanty, pwess 1 to speak with a wawwanty speciawist.
")
