import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage() : super();



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

TabController _tabController;
  

 @override
  void initState() {
    super.initState();
     _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    
      return new Container(
      color: Colors.white,
      child:new Stack(
        fit:StackFit.loose,
        alignment:Alignment.topCenter,
        children: <Widget>[ 
              new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Image.network(
                    "https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg",
                    fit:BoxFit.fitWidth
                    ),
                    new Expanded(

                     child: _bulidTabbar(),
                    ),
                   
                ],
              ),
    
     
           //输入框
            _buildTop(),


              
            ],  
         ),
        );
 }
            
_buildTop() {
          return  
          new Container(
          
            decoration:BoxDecoration(
            color:Color.fromARGB(100, 0, 0, 0),
            //border: new Border.all(color: Color(0xFFFF0000), width: 0.5), // 边色与边宽度
      
            borderRadius: new BorderRadius.circular((45.0)), // 圆角度
             //borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
            ) ,
          margin: EdgeInsets.only(top:33,left: 30,right: 30),
          height: 45,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon(
                 Icons.search,
                 color: Colors.white
            
            ),
            new Container(
              margin: EdgeInsets.only(left:23),
              width: 260,
              child:new Text(
              "请输入商品名称",
              style: new TextStyle(
                fontSize: 15,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
             ),
            )
            ],
          ),
        );  
     }

    _bulidTabbar() {
        return new Scaffold(
        appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
            height: 50.0,
            width: 20,

            child: new TabBar(
            indicatorColor: Colors.orange,
            tabs: <Widget>[
             _buildTabitem("最热"),
             _buildTabitem("灯具"),
             _buildTabitem("家具"),
             _buildTabitem("卫浴建材"),
            ],
            controller: _tabController,
          ),
            ),
          ),

        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new Center(child: new Text('最热')),
            new Center(child: new Text('灯具')),
            new Center(child: new Text('家具')),
             new Center(child: new Text('卫浴建材')),
          ],
        ),
      ); 
                
  }
  _buildTabitem(String txt){
      return  new Tab(
                child: new Text(
                  txt,
                  style:TextStyle(
                    fontSize: 17,
                    color: Colors.orange,
                  ),
                  
                ),
              );
  }
}




