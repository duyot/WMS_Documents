update mjr_stock_goods_total total
set total.issue_amount = (select e.amount_issue from 
(
  select c.id, c.stock_id, c.goods_id, c.amount, d.amount_order, c.amount - d.amount_order as amount_issue
  from mjr_stock_goods_total c,
  (
  select b.stock_id, a.goods_id, sum(a.amount) as amount_order
  from mjr_order_detail a, mjr_order b
  where a.order_id = b.id
  and b.status =1
  group by b.stock_id, a.goods_id
  ) d
  where c.stock_id =d.stock_id
  and c.goods_id =d.goods_id
)e
where e.id = total.id)
where 1=1;

update mjr_stock_goods_total
set issue_amount = amount
where issue_amount is null;