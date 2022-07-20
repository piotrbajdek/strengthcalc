! STRENGTHCALC VERSION 0.1.2 / MIT LICENSE © 2022 PIOTR BAJDEK

program strengthcalc

   implicit none

   character(len=10) :: arg1
   character(len=11) :: arg2
   character(len=10) :: arg3
   real :: mass
   real :: reps

   character(len=4) :: reset = ''//achar(27)//'[0m'      ! reset
   character(len=5) :: rd = ''//achar(27)//'[31m'        ! red
   character(len=5) :: ye = ''//achar(27)//'[93m'        ! bright yellow
   character(len=7) :: bl = ''//achar(27)//'[34;4m'      ! blue underlined
   character(len=5) :: cy = ''//achar(27)//'[36m'        ! cyan
   character(len=11) :: gr = ''//achar(27)//'[38;5;240m' ! grey

! NO ARGUMENTS PROVIDED

if (command_argument_count() == 0) then
   print '(a,a,a/)', rd, 'No arguments provided!', reset
   call help()
   return
end if

! GET ARGS TO DISPLAY DOCUMENTATION

call get_command_argument(1, arg1)

   select case (arg1)

   case ('-a', '--about')
   call about()
   return

   case ('-h', '--help')
   call help()
   return

   case ('-l', '--license')
   call license()
   return

   case ('-m', '--models')
   call models()
   return

   case ('-v', '--version')
   call version()
   return

   end select

! GET ARGS FOR CALCULATIONS

call get_command_argument(2, arg2)

   select case (arg2)

   case ('-p', '--pull-ups')
   call pull_ups()

   case ('-s', '--squats')
   call squats()

   case default
   print '(a,a,a/)', rd, 'Invalid or missing arguments!', reset
   call help()

   end select

contains

! DOCUMENTATION

   subroutine about()
   print '(a,a,a,a)', 'Program:  ', ye, 'strengthcalc', reset
   print '(a)', 'Version:  0.1.2'
   print '(a)', 'Date:     July 20, 2022'
   print '(a)', 'Author:   Piotr Bajdek (Poland)'
   print '(a,a,a,a)', 'Contact:  ', bl, 'piotr.bajdek@proton.me', reset
   print '(a,a,a,a)', 'Source:   ', bl, 'https://github.com/piotrbajdek/strengthcalc', reset
   print '(a)', 'License:  MIT License © 2022 Piotr Bajdek'
   end subroutine about

   subroutine help()
   print '(a,a,a,a)', 'Usage:     ', ye, '[BODY MASS IN KG] [EXERCISE] [MAX. REPETITIONS]', reset
   print '(a)', ''
   print '(a,a,a,a,a,a,a,a,a)', 'Exercises: ', cy, '-p', reset, ', ', cy, '--pull-ups', reset, '   Model for pull-ups'
   print '(a,a,a,a,a,a,a,a,a)', '           ', cy, '-s', reset, ', ', cy, '--squats', reset, '     Model for squats'
   print '(a)', ''
   print '(a,a,a,a)', 'Example:   ', ye, 'strengthcalc 67.5 --pull-ups 8', reset
   print '(a)', ''
   print '(a,a,a,a,a,a,a,a,a)', 'See also:  ', cy, '-a', reset, ', ', cy, '--about', reset, '      Show contact and program info'
   print '(a,a,a,a,a,a,a,a,a)', '           ', cy, '-h', reset, ', ', cy, '--help', reset, '       Show this help'
   print '(a,a,a,a,a,a,a,a,a)', '           ', cy, '-l', reset, ', ', cy, '--license', reset, '    Show licesing information'
   print '(a,a,a,a,a,a,a,a,a)', '           ', cy, '-m', reset, ', ', cy, '--models', reset, '     Show implemented formulae'
   print '(a,a,a,a,a,a,a,a,a)', '           ', cy, '-v', reset, ', ', cy, '--version', reset, '    Show program version'
   end subroutine help

   subroutine license()
   print '(a,a,a)', ye, 'MIT License', reset
   print '(a)', ''
   print '(a)', 'Copyright © 2022 Piotr Bajdek'
   print '(a)', ''
   print '(a)', 'Permission is hereby granted, free of charge, to any person obtaining a copy'
   print '(a)', 'of this software and associated documentation files (the "Software"), to deal'
   print '(a)', 'in the Software without restriction, including without limitation the rights'
   print '(a)', 'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell'
   print '(a)', 'copies of the Software, and to permit persons to whom the Software is'
   print '(a)', 'furnished to do so, subject to the following conditions:'
   print '(a)', ''
   print '(a)', 'The above copyright notice and this permission notice shall be included in all'
   print '(a)', 'copies or substantial portions of the Software.'
   print '(a)', ''
   print '(a)', 'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR'
   print '(a)', 'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,'
   print '(a)', 'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE'
   print '(a)', 'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER'
   print '(a)', 'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,'
   print '(a)', 'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE'
   print '(a)', 'SOFTWARE.'
   end subroutine license

   subroutine models()
   print '(a,a,a)', 'Pull-ups:          ', cy, 'Mayhew et al. (1992) formula:'
   print '(a,a,a)', ye, '100 * mass / (52.2 + 41.9 * exp (-0.055 * reps))', reset
   print '(a)', ''
   print '(a,a,a)', 'Squats:                   ', cy, 'Wathen (1994) formula:'
   print '(a,a)', ye, '100 * mass / (48.8 + 53.8 * exp (-0.075 * reps))'
   print '(a)', ''
   print '(a,a,a)', gr, '***', reset
   print '(a)', ''
   print '(a)', 'Mayhew, J.L., Ball, T.E., Arnold, M.D. and Bowen, J.C. 1992. Relative muscular'
   print '(a)', 'endurance performance as a predictor of bench press strength in college men'
   print '(a)', 'and women. J. Appl. Sports Sci. Res. 6 (4): 200–206.'
   print '(a)', ''
   print '(a)', 'Wathen, D. 1994. Load assignment. In: T.R. Baechle (Ed.), Essentials of'
   print '(a)', 'strength training and conditioning, pp. 435–446. Champaign, IL: Human Kinetics.'
   end subroutine models

   subroutine version()
   print '(a,a,a,a)', 'Version: ', ye, '0.1.2', reset
   print '(a)', 'July 20, 2022'
   end subroutine version

! CALCULATIONS

! PULL-UPS

   subroutine pull_ups()
   if (command_argument_count() == 2) then
      print '(a,a,a/)', rd, 'Missing value for the number of repetitions!', reset
      call help()
      return
   end if

   call get_command_argument(3, arg3)
   read(arg1,*) mass
   read(arg3,*) reps
   write(*, '(a,a,F0.1)') 'Approximate 1RM (kg):    ', ye, 100 * mass / (52.2 + 41.9 * exp (-0.055 * reps))
   print '(a,a,a)', gr, 'Max. weight you can load:', reset
   write(*, '(a,a,F0.1)') '1RM - body mass (kg):    ', ye, 100 * mass / (52.2 + 41.9 * exp (-0.055 * reps)) - mass
   end subroutine pull_ups

! SQUATS

   subroutine squats()
   if (command_argument_count() == 2) then
      print '(a,a,a/)', rd, 'Missing value for the number of repetitions!', reset
      call help()
      return
   end if

   call get_command_argument(3, arg3)
   read(arg1,*) mass
   read(arg3,*) reps
   write(*, '(a,a,F0.1)') 'Approximate 1RM (kg):    ', ye, 100 * mass / (48.8 + 53.8 * exp (-0.075 * reps))
   print '(a,a,a)', gr, 'Max. weight you can load:', reset
   write(*, '(a,a,F0.1)') '1RM - body mass (kg):    ', ye, 100 * mass / (48.8 + 53.8 * exp (-0.075 * reps)) - mass
   end subroutine squats

end program strengthcalc
