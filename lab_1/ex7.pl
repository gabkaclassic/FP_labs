is_leap_year(Year) :-
    0 is Year mod 4,
    (0 \= Year mod 100 ; 0 is Year mod 400).

days_in_month(1, _, 31).
days_in_month(2, Year, Days) :-
    (is_leap_year(Year) -> Days = 29 ; Days = 28).
days_in_month(3, _, 31).
days_in_month(4, _, 30).
days_in_month(5, _, 31).
days_in_month(6, _, 30).
days_in_month(7, _, 31).
days_in_month(8, _, 31).
days_in_month(9, _, 30).
days_in_month(10, _, 31).
days_in_month(11, _, 30).
days_in_month(12, _, 31).

day_of_week(2000, 1, 1, 6).
day_of_week(Year, Month, Day, DayOfWeek) :-
    days_in_month(Month, Year, DaysInMonth),
    Day > 1,
    PrevDay is Day - 1,
    day_of_week(Year, Month, PrevDay, PrevDayOfWeek),
    (PrevDayOfWeek = 6 -> DayOfWeek = 0 ; DayOfWeek is PrevDayOfWeek + 1).
day_of_week(Year, Month, 1, DayOfWeek) :-
    (Month = 1 -> PrevMonth = 12, PrevYear is Year - 1 ; PrevMonth is Month - 1, PrevYear = Year),
    days_in_month(PrevMonth, PrevYear, PrevMonthDays),
    day_of_week(PrevYear, PrevMonth, PrevMonthDays, PrevDayOfWeek),
    (PrevDayOfWeek = 6 -> DayOfWeek = 0 ; DayOfWeek is PrevDayOfWeek + 1).

is_date(Day, Month, Year, DayOfWeek) :-
    day_of_week(Year, Month, Day, DayOfWeek).

main :-
    is_date(26, 2, 2024, DayOfWeek),
    writeln(DayOfWeek).


:- initialization(main).
