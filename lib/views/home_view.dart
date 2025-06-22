import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather_app/views/Search_View.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(

          children: [
            const Text('Weather App'),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search_rounded),
            ),
          ],
        ),
      ),
      body: BlocBuilder<GetWeatherCubit , WeatherStates>(builder: (context,states) 
      {
        if(states is initialState)
        {
          return NoWeatherBody();
        }
        else if(states is weathherLoudedStates)
        {
          return WeatherInfoBody();
        }

        else 
        {
          return Text("opps there was an error");
        }
      })
        
          
    );
  }
}
