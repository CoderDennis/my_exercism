defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weekday %{:monday => 1,
             :tuesday => 2,
             :wednesday => 3,
             :thursday => 4,
             :friday => 5,
             :saturday => 6,
             :sunday => 7}

  @schedule_offset %{:first => 1,
                     :second => 8,
                     :third => 15,
                     :fourth => 22,
                     :teenth => 13}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :last) do
    last_day = :calendar.last_day_of_the_month(year, month)
    do_meetup(year, month, @weekday[weekday], last_day - 6)
  end
  def meetup(year, month, weekday, schedule) do
    do_meetup(year, month, @weekday[weekday], @schedule_offset[schedule])
  end

  defp do_meetup(year, month, weekday_num, offset) do
    day = weekday_num - :calendar.day_of_the_week(year, month, offset) + offset
    correct_offset(year, month, day, offset)
  end

  defp correct_offset(year, month, day, offset) when day < offset do
    {year, month, day + 7}
  end
  defp correct_offset(year, month, day, _offset), do: {year, month, day}

end
