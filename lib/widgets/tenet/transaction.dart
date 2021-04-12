import 'package:flutter/material.dart';

enum TransactionType { sent, received, pending }

class Transaction extends StatelessWidget {
  final TransactionType transactionType;
  final String transactionAmount, transactionInfo, transactionDate, receptient;
  const Transaction(
      {Key key,
      this.transactionType,
      this.transactionAmount,
      this.transactionInfo,
      this.transactionDate,
      this.receptient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String transactionName;
    IconData transactionIconData;
    Color color;
    switch (transactionType) {
      case TransactionType.sent:
        transactionName = "Sent";
        transactionIconData = Icons.arrow_upward;
        color = Theme.of(context).primaryColor;
        break;
      case TransactionType.received:
        transactionName = "Received";
        transactionIconData = Icons.arrow_downward;
        color = Colors.green;
        break;
      case TransactionType.pending:
        transactionName = "Pending";
        transactionIconData = Icons.arrow_downward;
        color = Colors.orange;
        break;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Container(
          height: 60,
          margin: EdgeInsets.all(9.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 120,   
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          child: Icon(
                            transactionIconData,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5.0),
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          receptient,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹$transactionAmount",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "$transactionInfo - $transactionDate",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          "$transactionName",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
