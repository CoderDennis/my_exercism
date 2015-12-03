defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from(date) do
		seconds = :calendar.datetime_to_gregorian_seconds({date, {0,0,0}}) +
              :math.pow(10, 9) |> trunc
		{result, _} = :calendar.gregorian_seconds_to_datetime(seconds)
		result
	end
end
