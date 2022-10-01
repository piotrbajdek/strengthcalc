# OVERVIEW OF STRENGTHCALC

[strengthcalc](https://github.com/piotrbajdek/strengthcalc) employs mathematical formulae from Mayhew et al. (1992) and Wathen (1994) to estimate the maximum weight one can lift in a single repetition of a physical exercise (known as 1RM: one repetition maximum). Calculations are based on (1) the body mass, (2) the exercise type, and (3) the maximum number of repetitions one is able to perform in a single set without an additional weight (i.e. with its own body mass).

strengthcalc is considered deprecated in favour of [musclecalc](https://github.com/piotrbajdek/musclecalc), which has been rewritten from Fortran into Rust. Since [musclecalc](https://github.com/piotrbajdek/musclecalc) (in Rust) is where the further development occurs, strengthcalc (in Fortran) will no longer be maintained.

[keywords: bodybuilding, calculator, calisthenics, callisthenics, fitness, gym, muscle strength, physical training, street workout]

strengthcalc can be used by both females and males. Implemented models:

**1. Pull-ups** (including chin-ups, will also work fine for dips and other upper-body exercises lifting the whole body)

– Mayhew et al. (1992) equation is used as it appears to be more accurate for the upper body (LeSuer et al. 1997; Jiménez and De Paz 2008).

**3. Squats**

– Wathen (1994) equation is used as it appears to be more accurate for the lower body (LeSuer et al. 1997).

**References:**

Jiménez, A. and De Paz, J.A. 2008. Application of the 1RM estimation formulas from the RM in bench press in a group of physically active middle-aged women. _J. Hum. Sport Exerc._ 3 (1): 10–22.

LeSuer, D.A, McCormick, J.H., Mayhew, J.L., Wasserstein, R.L. and Arnold, M.D. 1997. The accuracy of prediction equations for estimating 1-RM performance in the bench press, squat, and deadlift. _J. Strength and Cond. Res._ 11 (4): 211–213.

Mayhew, J.L., Ball, T.E., Arnold, M.D., and Bowen, J.C. 1992. Relative muscular endurance performance as a predictor of bench press strength in college men and women. _J. Appl. Sports Sci. Res._ 6 (4): 200–206.

Wathen, D. 1994. Load assignment. In: T.R. Baechle (Ed.), _Essentials of strength training and conditioning_, pp. 435–446. Champaign, IL: Human Kinetics.

# USAGE

![help-image](https://github.com/piotrbajdek/strengthcalc/blob/main/docs/images/help-image.png?raw=true)

![example-image-1](https://github.com/piotrbajdek/strengthcalc/blob/main/docs/images/example-image-1.png?raw=true)

# INSTALLATION

[strengthcalc](https://github.com/piotrbajdek/strengthcalc) should run smoothly on Windows and macOS, and can be built by the use of [Fortran Package Manager (fpm)](https://fpm.fortran-lang.org/en/index.html). Yet, it has been developed and tested on Fedora Linux. The binary 'strengthcalc' for Linux x86_64 can be downloaded [here](https://github.com/piotrbajdek/strengthcalc/releases/tag/v0.1.3).
