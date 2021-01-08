module AlanPerlis
  module_function

  QUOTES = [
    "One man's constant is another man's variable.",
    'Syntactic sugar causes cancer of the semi-colons.',
    'Every program is a part of some other program and rarely fits.',
    'If a program manipulates a large amount of data, it does so in a small number of ways.',
    'Symmetry is a complexity reducing concept (co-routines include sub-routines); seek it everywhere.',
    'It is easier to write an incorrect program than understand a correct one.',
    'A programming language is low level when its programs require attention to the irrelevant.',
    'It is better to have 100 functions operate on one data structure than 10 functions on 10 data structures.',
    'If you have a procedure with 10 parameters, you probably missed some.',
    'Recursion is the root of computation since it trades description for time.',
    'Everything should be built top-down, except the first time.',
    "Every program has (at least) two purposes: the one for which it was written and another for which it wasn't.",
    "If a listener nods his head when you're explaining your program, wake him up.",
    "A program without a loop and a structured variable isn't worth writing.",
    "A language that doesn't affect the way you think about programming, is not worth knowing.",
    'Wherever there is modularity there is the potential for misunderstanding: Hiding information implies a need to check communication.',
    'Optimization hinders evolution.',
    "A good system can't have a weak command language.",
    'To understand a program you must become both the machine and the program.',
    "Perhaps if we wrote programs from childhood on, as adults we'd be able to read them.",
    'There will always be things we wish to say in our programs that in all known languages can only be said poorly.',
    'Once you understand how to write a program get someone else to write it.',
    'Around computers it is difficult to find the correct unit of time to measure progress. Some cathedrals took a century to complete. Can you imagine the grandeur and scope of a program that would take as long?',
    'In programming, everything we do is a special case of something more general - and often we know it too quickly.',
    'Simplicity does not precede complexity, but follows it.',
    'Programmers are not to be measured by their ingenuity and their logic but by the completeness of their case analysis.',
    'The use of a program to prove the 4-color theorem will not change mathematics - it merely demonstrates that the theorem, a challenge for a century, is probably not important to mathematics.',
    'Re graphics: A picture is worth 10K words - but only those to describe the picture. Hardly any sets of 10K words can be adequately described with pictures.',
    'There are two ways to write error-free programs; only the third one works.',
    'In software systems it is often the early bird that makes the worm.',
    'Sometimes I think the only universal in the computing field is the fetch-execute-cycle.',
    "As Will Rogers would have said, 'There is no such thing as a free variable'.",
    "Systems have sub-systems and sub-systems have sub-systems and so on ad infinitum - which is why we're always starting over.",
    'So many good ideas are never heard from again once they embark in a voyage on the semantic gulf.',
    'Beware of the Turing tar-pit in which everything is possible but nothing of interest is easy.',
    'A LISP programmer knows the value of everything, but the cost of nothing.',
    'Software is under a constant tension. Being symbolic it is arbitrarily perfectible; but also it is arbitrarily changeable.',
    'It is easier to change the specification to fit the program than vice versa.',
    'Fools ignore complexity. Pragmatists suffer it. Some can avoid it. Geniuses remove it.',
    'In programming, as in everything else, to be in error is to be reborn.',
    'In computing, invariants are ephemeral.',
    "When we write programs that 'learn', it turns out we do and they don't.",
    'Often it is means that justify ends: Goals advance technique and technique survives even when goal structures crumble.',
    'Make no mistake about it: Computers process numbers - not symbols. We measure our understanding (and control) by the extent to which we can arithmetize an activity.',
    'Making something variable is easy. Controlling duration of constancy is the trick.',
    'If we believe in data structures, we must believe in independent (hence simultaneous) processing. For why else would we collect items within a structure? Why do we tolerate languages that give us the one without the other?',
    'Documentation is like term insurance: It satisfies because almost no one who subscribes to it depends on its benefits.',
    'It is the user who should parameterize procedures, not their creators.',
    'The cybernetic exchange between man, computer and algorithm is like a game of musical chairs: The frantic search for balance always leaves one of the three standing ill at ease.',
    'A year spent in artificial intelligence is enough to make one believe in God.',
    'Prolonged contact with the computer turns mathematicians into clerks and vice versa.',
    'In computing, turning the obvious into the useful is a living definition of the word "frustration".',
    'Motto for a research laboratory: What we work on today, others will first think of tomorrow.',
    'The computer is the ultimate polluter. Its feces are indistinguishable from the food it produces.',
    "Interfaces keep things tidy, but don't accelerate growth: Functions do.",
    "Don't have good ideas if you aren't willing to be responsible for them.",
    "Computers don't introduce order anywhere as much as they expose opportunities.",
    'In computing, the mean time to failure keeps getting shorter.',
    "In man-machine symbiosis, it is man who must adjust: The machines can't.",
    'We will never run out of things to program as long as there is a single program around.',
    "Dealing with failure is easy: Work hard to improve. Success is also easy to handle: You've solved the wrong problem. Work hard to improve.",
    "One can't proceed from the informal to the formal by formal means.",
    'Purely applicative languages are poorly applicable.',
    "The proof of a system's value is its existence.",
    "You can't communicate complexity, only an awareness of it.",
    'Whenever two programmers meet to criticize their programs, both are silent.',
    'Why did the Roman Empire collapse? What is the Latin for office automation?',
    'Computer Science is embarrassed by the computer.',
    'The only constructive theory connecting neuroscience and psychology will arise from the study of software.',
    'Within a computer natural language is unnatural.',
    'Most people find the concept of programming obvious, but the doing impossible.',
    'You think you know when you learn, are more sure when you can write, even more when you can teach, but certain when you can program.',
    'It goes against the grain of modern education to teach children to program. What fun is there in making plans, acquiring discipline in organizing thoughts, devoting attention to detail and learning to be self-critical?',
    'Programming is an unnatural act.',
    'Adapting old programs to fit new machines usually means adapting new machines to behave like old ones.',
    'In seeking the unattainable, simplicity only gets in the way.'
  ].freeze

  def random_quote
    QUOTES.sample
  end
end
