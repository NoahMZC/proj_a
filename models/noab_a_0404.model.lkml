connection: "noah_a_0404"

# include all the views
include: "/views/**/*.view"

datagroup: noab_a_0404_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noab_a_0404_default_datagroup

explore: bm_d_time_range_cd {}

explore: bm_d_passenger_type_cd {}

explore: bm_d_holiday_dt {}

explore: bm_f_passenger_subway_dd {
  join: date_foot {
    type: inner
    sql_on: ${bm_f_passenger_subway_dd.dt_date} = ${date_foot.bm_f_passenger_subway_dd_dt_date} ;;
    relationship: many_to_one
  }
  join: one_month_before {
    type: left_outer
    sql_on: ${bm_f_passenger_subway_dd.passenger_type_cd} = ${one_month_before.bm_f_passenger_subway_dd_passenger_type_cd}
           AND ${bm_f_passenger_subway_dd.dt_date} - INTERVAL '1' MONTH = ${one_month_before.bm_f_passenger_subway_dd_dt_date};;
          relationship: many_to_one
  }
}

explore: bm_d_transfer_station {}

explore: bm_f_card_subway_dd {}
