select
  i.number,
  i.status,
  m.status_text
from
  invoice i,
  app_support.invoice_status_map m
where
  i.number in (
    '91341130',
    '9693',
    '1102140601',
    '86451',
    '74090',
    '74088',
    '74080',
    '000003707',
    '42241',
    '00100772',
    '91339024',
    '0600257416',
    '21284',
    'A 186659',
    '31119697',
    '37833',
    'INV-210083',
    'IA09-00673890',
    '7133',
    'WTS APR2023 "D"',
    '167170'
  )
  AND i.status = m.status_id;