class Items{
  final String name;
  final String description;
  final String category;
  
  final String expiry;
  final String basebid;
  final String imagepath;
  String? maxbid;
  String? fulldescription;
  
  Items({required this.name, required this.description, required this.expiry, required this.basebid, required this.imagepath,required this.category,this.maxbid,this.fulldescription,});
}

  
  
