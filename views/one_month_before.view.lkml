view: one_month_before {
  derived_table: {
    sql: WITH date_foot AS (SELECT
          (bm_f_passenger_subway_dd.dt ) AS bm_f_passenger_subway_dd_dt_date,
          COALESCE(SUM(bm_f_passenger_subway_dd.foot_traffic_cnt ), 0) AS bm_f_passenger_subway_dd_sum_foot_traffic_cnt,

      FROM `project_a_team.bm_f_passenger_subway_dd`
      AS bm_f_passenger_subway_dd
      GROUP BY
      1
      ORDER BY
      1 DESC
      )
      SELECT
      date_foot.bm_f_passenger_subway_dd_sum_foot_traffic_cnt  AS date_foot_bm_f_passenger_subway_dd_sum_foot_traffic_cnt,
      (bm_f_passenger_subway_dd.dt ) AS bm_f_passenger_subway_dd_dt_date,
      bm_f_passenger_subway_dd.passenger_type_cd  AS bm_f_passenger_subway_dd_passenger_type_cd,
      COALESCE(SUM(bm_f_passenger_subway_dd.foot_traffic_cnt ), 0) AS bm_f_passenger_subway_dd_sum_foot_traffic_cnt,
      COALESCE(SUM(bm_f_passenger_subway_dd.getoff_passenger_cnt ), 0) AS bm_f_passenger_subway_dd_sum_getoff_passenger_cnt,
      COALESCE(SUM(bm_f_passenger_subway_dd.passenger_cnt ), 0) AS bm_f_passenger_subway_dd_sum_passenger_cnt,
      COALESCE(SUM(bm_f_passenger_subway_dd.clean_transported_cnt ), 0) AS bm_f_passenger_subway_dd_sum_clean_transported_cnt
      FROM `project_a_team.bm_f_passenger_subway_dd`
      AS bm_f_passenger_subway_dd
      INNER JOIN date_foot ON bm_f_passenger_subway_dd.dt = date_foot.bm_f_passenger_subway_dd_dt_date
      WHERE (bm_f_passenger_subway_dd.dt ) < ((DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL -1 MONTH)))
      GROUP BY
      1,
      2,
      3
      ORDER BY
      2 DESC
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date_foot_bm_f_passenger_subway_dd_sum_foot_traffic_cnt {
    type: number
    sql: ${TABLE}.date_foot_bm_f_passenger_subway_dd_sum_foot_traffic_cnt ;;
  }

  dimension: bm_f_passenger_subway_dd_dt_date {
    type: date
    datatype: date
    sql: ${TABLE}.bm_f_passenger_subway_dd_dt_date ;;
  }

  dimension: bm_f_passenger_subway_dd_passenger_type_cd {
    type: string
    sql: ${TABLE}.bm_f_passenger_subway_dd_passenger_type_cd ;;
  }

  dimension: bm_f_passenger_subway_dd_sum_foot_traffic_cnt {
    type: number
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_foot_traffic_cnt ;;
  }

  dimension: bm_f_passenger_subway_dd_sum_getoff_passenger_cnt {
    type: number
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_getoff_passenger_cnt ;;
  }

  dimension: bm_f_passenger_subway_dd_sum_passenger_cnt {
    type: number
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_passenger_cnt ;;
  }

  dimension: bm_f_passenger_subway_dd_sum_clean_transported_cnt {
    type: number
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_clean_transported_cnt ;;
  }

  measure: sum_bm_f_passenger_subway_dd_sum_foot_traffic_cnt {
    type: sum
    label: "전달 유동인원수 합"
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_foot_traffic_cnt ;;
  }

  measure: sum_bm_f_passenger_subway_dd_sum_getoff_passenger_cnt {
    type: sum
    label: "전달 하차 인원수 합"
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_getoff_passenger_cnt ;;
  }

  measure: sum_bm_f_passenger_subway_dd_sum_passenger_cnt {
    type: sum
    label: "전달 승차인원수 합"
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_passenger_cnt ;;
  }

  measure: sum_bm_f_passenger_subway_dd_sum_clean_transported_cnt {
    type: sum
    label: "전달 순수송인원수 합"
    sql: ${TABLE}.bm_f_passenger_subway_dd_sum_clean_transported_cnt ;;
  }

  measure: sum_date_foot_bm_f_passenger_subway_dd_sum_foot_traffic_cnt {
    type: sum
    label: "전달 나눌거 총합"
    sql: ${TABLE}.date_foot_bm_f_passenger_subway_dd_sum_foot_traffic_cnt ;;
  }


  set: detail {
    fields: [
      date_foot_bm_f_passenger_subway_dd_sum_foot_traffic_cnt,
      bm_f_passenger_subway_dd_dt_date,
      bm_f_passenger_subway_dd_passenger_type_cd,
      bm_f_passenger_subway_dd_sum_foot_traffic_cnt,
      bm_f_passenger_subway_dd_sum_getoff_passenger_cnt,
      bm_f_passenger_subway_dd_sum_passenger_cnt,
      bm_f_passenger_subway_dd_sum_clean_transported_cnt
    ]
  }
}
