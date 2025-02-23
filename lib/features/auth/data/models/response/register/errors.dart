class Errors {
	String? value;
	String? msg;
	String? param;
	String? location;

	Errors({this.value, this.msg, this.param, this.location});

	factory Errors.fromJson(Map<String, dynamic> json) => Errors(
				value: json['value'] as String?,
				msg: json['msg'] as String?,
				param: json['param'] as String?,
				location: json['location'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'value': value,
				'msg': msg,
				'param': param,
				'location': location,
			};
}
