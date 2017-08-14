CREATE OR REPLACE VIEW demo_pzxxext AS (
  SELECT
    pz.*, bd.totalzdsl AS zdsl,
    kcb.kcsl
  FROM
    demo_pzxx pz,
    demo_kcb kcb,
    (
      SELECT
        sum(zdsl) AS totalzdsl,
        pzbm
      FROM
        demo_bdxx
      GROUP BY
        pzbm
    ) bd
  WHERE
    pz.id_pzxx = bd.pzbm
  AND pz.id_pzxx = kcb.pzbm
)