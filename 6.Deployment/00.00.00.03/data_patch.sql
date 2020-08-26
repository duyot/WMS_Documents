--Dong bo cac ban ghi sang bang REVENUE_HISTORY
  insert into REVENUE_HISTORY (ID,CUST_ID, PARTNER_ID,AMOUNT,VAT,CHARGE,STOCK_TRANS_ID,STOCK_TRANS_CODE,DESCRIPTION,TYPE,CREATED_DATE,CREATED_USER ) 
  select SEQ_REVENUE_HISTORY.nextval, CUST_ID, receive_ID, trans_money_total, -1, 0, id, code, description, 1,CREATED_DATE, CREATED_USER
  from mjr_stock_trans
  where type =2;
  