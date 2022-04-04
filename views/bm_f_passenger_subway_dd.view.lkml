view: bm_f_passenger_subway_dd {
  sql_table_name: `project_a_team.bm_f_passenger_subway_dd`
    ;;

  dimension: clean_transported_cnt {
    type: number
    sql: ${TABLE}.clean_transported_cnt ;;
  }

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: foot_traffic_cnt {
    type: number
    sql: ${TABLE}.foot_traffic_cnt ;;
  }

  dimension: getoff_passenger_cnt {
    type: number
    sql: ${TABLE}.getoff_passenger_cnt ;;
  }

  dimension: passenger_cnt {
    type: number
    sql: ${TABLE}.passenger_cnt ;;
  }

  dimension: passenger_type_cd {
    type: string
    sql: ${TABLE}.passenger_type_cd ;;
  }

  dimension: station_cd {
    type: string
    sql: ${TABLE}.station_cd ;;
  }

  dimension: subway_line_cd {
    type: string
    sql: ${TABLE}.subway_line_cd ;;
  }

  dimension: tm_range_cd {
    type: string
    sql: ${TABLE}.tm_range_cd ;;
  }
  ###
  measure: sum_foot_traffic_cnt {
    type: sum
    label: "유동인원수 합"
    sql: ${TABLE}.foot_traffic_cnt ;;
  }

  measure: sum_getoff_passenger_cnt {
    type: sum
    label: "하차인원수 합"
    sql: ${TABLE}.getoff_passenger_cnt ;;
  }

  measure: sum_passenger_cnt {
    type: sum
    label: "승차인원수"
    sql: ${TABLE}.passenger_cnt ;;
  }
  measure: sum_clean_transported_cnt {
    type: sum
    label: "순수송인원수"
    sql: ${TABLE}.clean_transported_cnt ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
