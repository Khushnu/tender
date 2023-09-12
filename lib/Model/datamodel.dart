class DataModel{
final String name; 
final int age; 
final String distance; 
final String image;

DataModel( {required this.name, required this.age, required this.distance, required this.image,});

}

List<DataModel> data = [
  DataModel(name: 'Walter White', age: 44, distance: '23km away', image: 'https://static.wikia.nocookie.net/villains/images/6/65/Walter_White2.jpg/revision/latest/scale-to-width-down/1000?cb=20230109113855'), 
  DataModel(name: 'Clara', age: 34, distance: '3km away', image: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80'), 
  DataModel(name: 'Jessie PinkMan', age: 24, distance: '10km away', image: 'https://m.media-amazon.com/images/M/MV5BMTY1OTY5NjI5NV5BMl5BanBnXkFtZTcwODA4MjM0OA@@._V1_FMjpg_UX1000_.jpg'), 
  DataModel(name: 'Alexa JD', age: 19, distance: '3.2km away', image: 'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/f0139d79-8c6d-4826-04a9-32af6b771700/width=450/00026-1970435715.jpeg'), 
  DataModel(name: 'Jhon Ce', age: 22, distance: '2.3km away', image: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3387&q=80'), 
  DataModel(name: 'Donald Ford', age: 43, distance: '4km away', image: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3149&q=80'), 
  DataModel(name: 'James Carter', age: 29, distance: '8km away', image: 'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2592&q=80'), 
  DataModel(name: 'Cardi B', age: 33, distance: '14km away', image: 'https://images.unsplash.com/photo-1542206395-9feb3edaa68d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2580&q=80'), 
];