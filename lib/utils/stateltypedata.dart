
class StateType {
  final String type;
  bool isseleted;
  StateType({
    required this.type,
    required this.isseleted
  });
  static List<StateType> statedataList = [
    StateType(
      type: 'Default',
      isseleted: false
    ),
    StateType(
      type: 'During Fasting',
      isseleted: false
      
    ),
    StateType(
      type: 'After Eating(1h)',
      isseleted: false
    ),
    StateType(
      type: 'After Eating(2h)',
      isseleted: false
    ),
    StateType(
      type: 'Before Bedtime',
      isseleted: false
    ),
    StateType(
      type: 'Before Workout',
      isseleted: false
    ),
    StateType(
      type: 'After Workout',
      isseleted: false
    ),
  ];
}
