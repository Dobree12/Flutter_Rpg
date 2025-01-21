import 'package:flutter/material.dart';
import 'package:testam_sa_mearga/models/character.dart';
import 'package:testam_sa_mearga/shared/styled_text.dart';
import 'package:testam_sa_mearga/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});
  
  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          //available point
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.star,
                color:widget.character.points > 0 ? Colors.yellow : Colors.grey),
                SizedBox(width: 20),
                StyledText('Stat points available:  '),
                Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),
          //stats table
          Table(
            children: widget.character.statsAsFormattedList.map((stats){
              return TableRow(
                decoration: BoxDecoration(color: AppColors.secondaryColor.withOpacity(0.2)),
                children: [
                  //stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child:Padding(
                      padding: EdgeInsets.all(8),
                      child: StyledHeading(stats['title']!),
                    ),
                   ),
                    //stat value
                     TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    child:Padding(
                      padding: EdgeInsets.all(8),
                      child: StyledHeading(stats['value']!),
                    ),
                     ),
                     TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            widget.character.increaseStat(stats['title']!);
                          });
                          
                        },
                         icon: Icon(Icons.arrow_upward, color: AppColors.textColor),
                        ),
                      ),
                       TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            widget.character.decreaseStat(stats['title']!);
                          });
                          
                        },
                         icon: Icon(Icons.arrow_downward, color: AppColors.textColor),
                        ),
                      ),

                ]
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}