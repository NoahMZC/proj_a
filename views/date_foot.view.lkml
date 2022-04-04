view: date_foot {
  derived_table: {
    sql: SELECT
          (bm_f_passenger_subway_dd.dt ) AS bm_f_passenger_subway_dd_dt_date,
          COALESCE(SUM(bm_f_passenger_subway_dd.foot_traffic_cnt ), 0) AS bm_f_passenger_subway_dd_sum_foot_traffic_cnt,

      FROM `project_a_team.bm_f_passenger_subway_dd`
      AS bm_f_passenger_subway_dd
      GROUP BY
      1
      ORDER BY
      1 DESC
      ;;
  }
  dimension: id {
    primary_key: yes
    sql:  ${TABLE}.bm_f_passenger_subway_dd_dt_date;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bm_f_passenger_subway_dd_dt_date {
    type: date
    datatype: date
    sql: ${TABLE}.bm_f_passenger_subway_dd_dt_date ;;
  }

  dimension: bm_f_passenger_subway_dd_sum_foot_traffic_cnt {
    type: number
    label: "총 합산값. 나눌거"
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_foot_traffic_cnt ;;
  }
  # measure: bm_f_passenger_subway_dd_sum_foot_traffic_cnt {
  #   type: sum
  #   label: "총 합산값. 나눌거"
  #   sql: ${TABLE}.bm_f_passenger_subway_dd_sum_foot_traffic_cnt ;;
  # }

  set: detail {
    fields: [bm_f_passenger_subway_dd_dt_date, bm_f_passenger_subway_dd_sum_foot_traffic_cnt]
  }
}
