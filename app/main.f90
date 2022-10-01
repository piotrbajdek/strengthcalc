! STRENGTHCALC VERSION 0.1.3 / MIT LICENSE © 2022 PIOTR BAJDEK
! MAIN FILE

program main
  use calc, only: pull_ups, squats
  use menu, only: about, help, license, models, version
  implicit none

  character(len=10) :: arg1
  character(len=11) :: arg2

  character(len=4) :: reset = ''//achar(27)//'[0m'      ! reset
  character(len=5) :: rd = ''//achar(27)//'[31m'        ! red

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
end program main
