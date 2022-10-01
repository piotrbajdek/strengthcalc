! STRENGTHCALC VERSION 0.1.3 / MIT LICENSE © 2022 PIOTR BAJDEK
! MODULE CALC

module calc
  use menu, only: help
  implicit none
  private

  character(len=10) :: arg1
  character(len=10) :: arg3
  real :: mass
  real :: reps

  character(len=4) :: reset = ''//achar(27)//'[0m'      ! reset
  character(len=5) :: rd = ''//achar(27)//'[31m'        ! red
  character(len=5) :: ye = ''//achar(27)//'[93m'        ! bright yellow
  character(len=11) :: gr = ''//achar(27)//'[38;5;240m' ! grey

  public :: pull_ups
  public :: squats
contains

! PULL-UPS

  subroutine pull_ups()
  if (command_argument_count() == 2) then
    print '(a,a,a/)', rd, 'Missing value for the number of repetitions!', reset
    call help()
    return
  end if

  call get_command_argument(1, arg1)
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

  call get_command_argument(1, arg1)
  call get_command_argument(3, arg3)
    read(arg1,*) mass
    read(arg3,*) reps
    write(*, '(a,a,F0.1)') 'Approximate 1RM (kg):    ', ye, 100 * mass / (48.8 + 53.8 * exp (-0.075 * reps))
    print '(a,a,a)', gr, 'Max. weight you can load:', reset
    write(*, '(a,a,F0.1)') '1RM - body mass (kg):    ', ye, 100 * mass / (48.8 + 53.8 * exp (-0.075 * reps)) - mass
  end subroutine squats

end module calc
