class RolModelo {
  late int id = 0;
  late String rolNombre;
  RolModelo({
    required this.id,
    required this.rolNombre,
  });

  RolModelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rolNombre = json['rolNombre'];
  }

  Map<String, dynamic> toJson() {
    final data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rolNombre'] = this.rolNombre;
    return data;
  }
}
