class HomeController < ApplicationController

    def home
        render 'menu'
    end

    def result
      stop_a_array = params['stop_a'].split('- ')
      start_train = stop_a_array[0].to_sym
      stop_a = stop_a_array[1]
      stop_b_array = params['stop_b'].split('- ')
      stop_train = stop_b_array[0].to_sym
      stop_b = stop_b_array[1]

    n = ['ts', '34th', '28th', '23rd', 'us', '8th']
    l = ['8th', '6th', 'us', '3rd', '1st']
    s = ['gc', '33rd', '28th', '23rd', 'us', 'ap']

    mta = {}

    mta[:n] = n
    mta[:l] = l
    mta[:s] = s

    intersection = (mta[start_train] & mta[stop_train]).first

    if start_train != stop_train
      stop_a_index = mta[start_train].index(stop_a)
      stop_a_intersection_index = mta[start_train].index(intersection)
      trip_a_length = (stop_a_index - stop_a_intersection_index).abs

      stop_b_index = mta[stop_train].index(stop_b)
      stop_b_intersection_index = mta[stop_train].index(intersection)
      trip_b_length = (stop_b_index - stop_b_intersection_index).abs

      total_length_of_trip = trip_a_length + trip_b_length
    else
      stop_a_index = mta[start_train].index(stop_a)
      stop_b_index = mta[stop_train].index(stop_b)
      total_length_of_trip = (stop_a_index - stop_b_index).abs
    end

    @result = "\n\nYour trip length is #{total_length_of_trip} stops.\n\n"

    render "menu"
    end


end




