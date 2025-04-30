class WeatherModel {
    final String date;
    final String day;
    final String icon;
    final String description;
    final String status;
    final String degree;
    final String min;
    final String max;
    final String humidity;

    WeatherModel(
        this.date,
        this.day,
        this.degree,
        this.description,
        this.humidity,
        this.icon,
        this.max,
        this.min,
        this.status,

    );

    factory WeatherModel.fromJson(Map<String, dynamic> json) {
        return WeatherModel(
            json["date"],
            json["day"],
            json["degree"],
            json["description"],
            json["humidity"],
            json["icon"],
            json["max"],
            json["min"],
            json["status"]
        );
    }
}
