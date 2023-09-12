class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final List<QuestionContent> contents;
  final List<String> answers; // index lenght must be 4 {0, 1, 2, 3}
  final int correct; // filled with index of correct answers

  Question(
      {required this.contents, required this.answers, required this.correct});
}

class QuestionContent {
  final String
      content; // if type is 1 it's filled with question and if type is 2 it's filled with image asset path
  final int type; // only 1 or 2

  QuestionContent({required this.content, required this.type});
}

List<Quiz> getQuizs = [
  Quiz(title: 'Disaster', questions: [
    Question(
      contents: [
        QuestionContent(
          content: 'What is the primary cause of earthquakes?',
          type: 1,
        ),
      ],
      answers: [
        'Volcanic eruptions',
        'Tornadoes',
        'Tectonic plate movement',
        'Heavy rainfall',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which of the following is a natural disaster associated with water?',
          type: 1,
        ),
      ],
      answers: [
        'Wildfire',
        'Flood',
        'Earthquake',
        'Heatwave',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'What is the most common gas emitted during a volcanic eruption?',
          type: 1,
        ),
      ],
      answers: [
        'Oxygen',
        'Carbon dioxide',
        'Hydrogen',
        'Methane',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which of the following disasters is caused by the rapid shifting of tectonic plates beneath the Earth\'s surface?',
          type: 1,
        ),
      ],
      answers: [
        'Tornado',
        'Hurricane',
        'Earthquake',
        'Flood',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'What is the primary cause of tsunamis?',
          type: 1,
        ),
      ],
      answers: [
        'Volcanic eruption',
        'Tornado',
        'Earthquake under the ocean floor',
        'Heavy rainfall',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which type of disaster is characterized by a sudden and violent shaking of the ground?',
          type: 1,
        ),
      ],
      answers: [
        'Tornado',
        'Earthquake',
        'Flood',
        'Hurricane',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'What is the main cause of wildfires?',
          type: 1,
        ),
      ],
      answers: [
        'Heavy rainfall',
        'Tornadoes',
        'Human activity',
        'Earthquakes',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which of the following disasters is driven by the heating of the Earth\'s atmosphere?',
          type: 1,
        ),
      ],
      answers: [
        'Earthquake',
        'Tornado',
        'Heatwave',
        'Flood',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'What is the primary cause of landslides?',
          type: 1,
        ),
      ],
      answers: [
        'Tornadoes',
        'Heavy rainfall',
        'Volcanic eruption',
        'Tectonic plate movement',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which disaster is characterized by the overflow of water onto normally dry land?',
          type: 1,
        ),
      ],
      answers: [
        'Tornado',
        'Wildfire',
        'Flood',
        'Earthquake',
      ],
      correct: 2,
    ),
  ]),
  Quiz(title: 'Disaster 2', questions: [
    Question(
      contents: [
        QuestionContent(
          content: 'What is the primary cause of earthquakes?',
          type: 1,
        ),
      ],
      answers: [
        'Volcanic eruptions',
        'Tornadoes',
        'Tectonic plate movement',
        'Heavy rainfall',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which of the following is a natural disaster associated with water?',
          type: 1,
        ),
      ],
      answers: [
        'Wildfire',
        'Flood',
        'Earthquake',
        'Heatwave',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'What is the most common gas emitted during a volcanic eruption?',
          type: 1,
        ),
      ],
      answers: [
        'Oxygen',
        'Carbon dioxide',
        'Hydrogen',
        'Methane',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which of the following disasters is caused by the rapid shifting of tectonic plates beneath the Earth\'s surface?',
          type: 1,
        ),
      ],
      answers: [
        'Tornado',
        'Hurricane',
        'Earthquake',
        'Flood',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'What is the primary cause of tsunamis?',
          type: 1,
        ),
      ],
      answers: [
        'Volcanic eruption',
        'Tornado',
        'Earthquake under the ocean floor',
        'Heavy rainfall',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which type of disaster is characterized by a sudden and violent shaking of the ground?',
          type: 1,
        ),
      ],
      answers: [
        'Tornado',
        'Earthquake',
        'Flood',
        'Hurricane',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'What is the main cause of wildfires?',
          type: 1,
        ),
      ],
      answers: [
        'Heavy rainfall',
        'Tornadoes',
        'Human activity',
        'Earthquakes',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which of the following disasters is driven by the heating of the Earth\'s atmosphere?',
          type: 1,
        ),
      ],
      answers: [
        'Earthquake',
        'Tornado',
        'Heatwave',
        'Flood',
      ],
      correct: 2,
    ),
    Question(
      contents: [
        QuestionContent(
          content: 'What is the primary cause of landslides?',
          type: 1,
        ),
      ],
      answers: [
        'Tornadoes',
        'Heavy rainfall',
        'Volcanic eruption',
        'Tectonic plate movement',
      ],
      correct: 1,
    ),
    Question(
      contents: [
        QuestionContent(
          content:
              'Which disaster is characterized by the overflow of water onto normally dry land?',
          type: 1,
        ),
      ],
      answers: [
        'Tornado',
        'Wildfire',
        'Flood',
        'Earthquake',
      ],
      correct: 2,
    ),
  ])
];