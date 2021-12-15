extends Resource

signal time_changed(old_time, new_time)

const TIME_CHECK_INTERVAL = 15 * 60 # 15 minutes * 60 seconds
var time_scale = 900 # how many in game seconds should pass every second
var time_counter = 0

var time: int = date_to_int(1, 22, 0)

# 0bddddddddddddddddhhhhhhhhmmmmmmmm
# First 16 bits are for the day, next 8 are hour, final 8 are minute

const MIN_MASK = 0b11111111
const HR_OFFSET = 8
const HR_MASK = 0b11111111 << HR_OFFSET
const DAY_OFFSET = 16
const DAY_MASK = 0b111111111111111 << DAY_OFFSET

func get_time_str(t) -> String:
	var day = (t & DAY_MASK) >> DAY_OFFSET
	var hour = (t & HR_MASK) >> HR_OFFSET
	var minute = t & MIN_MASK
	var am_pm = "pm" if hour > 12 else "am"
	
	hour = hour % 12
	if hour == 0: # if it's midnight, show 12am rather than 0am
		hour = 12
	
	return "Day %s %s:%02d%s" % [ day, hour, minute, am_pm ]

func process(delta: float):
	time_counter += delta * time_scale
	if time_counter >= TIME_CHECK_INTERVAL: # Check if 15 minutes has passed
		time_counter = fmod(time_counter, TIME_CHECK_INTERVAL)
		var last_time = time
		time += 15
		time = normalize_time(time)
		
		emit_signal("time_changed", last_time, time)
	
func date_to_int(day: int, hour: int, minute: int) -> int:
	return day << DAY_OFFSET | hour << HR_OFFSET | minute

func add_times(time1: int, time2: int) -> int:
	return normalize_time(normalize_time(time1) + normalize_time(time2))
	
func sub_times(time1: int, time2: int) -> int:
	return normalize_time(normalize_time(time1) - normalize_time(time2))

func normalize_time(t: int) -> int:
	var day = (t & DAY_MASK) >> DAY_OFFSET
	var hour = (t & HR_MASK) >> HR_OFFSET
	var minute = (t & MIN_MASK)
	
	hour += minute / 60
	day += hour / 24
	hour = hour % 24
	minute = minute % 60
	
	return (day << DAY_OFFSET) + (hour << HR_OFFSET) + minute
