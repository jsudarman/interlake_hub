// Central data store for Interlake Student Hub
// All data persists via localStorage; this file provides defaults.

const DEFAULT_CLUBS = [
  {
    id: "robotics",
    name: "Robotics Club",
    category: "engineering",
    tagline: "Build, code, compete.",
    description: "Interlake's Robotics Club participates in the FIRST Robotics Competition (FRC) and VEX Robotics. Members design, build, program, and operate robots to compete at regional and state-level competitions. Sub-teams cover mechanical engineering, electrical systems, software, and outreach.",
    advisor: "Mr. Johnson",
    advisorEmail: "rjohnson@bsd405.org",
    meetingDays: "Tuesdays & Thursdays",
    meetingTime: "3:15 PM – 5:00 PM",
    meetingLocation: "Room B-214",
    requirements: [
      "Open to all grades (9–12)",
      "Attend at least 2 intro meetings before joining a sub-team",
      "75% attendance commitment during build season (Jan–Mar)"
    ],
    howToJoin: "Show up to any Tuesday or Thursday meeting in Room B-214. No experience necessary — we welcome all skill levels and backgrounds!",
    contactEmail: "robotics@interlake.example",
    instagram: "@interlakerobotics",
    members: 52,
    featured: true,
    officers: [
      { name: "Ethan Park", role: "President", grade: "12", email: "epark@interlake.example" },
      { name: "Priya Nair", role: "VP of Engineering", grade: "11" },
      { name: "Marcus Chen", role: "VP of Software", grade: "11" },
      { name: "Sofia Romero", role: "Secretary", grade: "10" },
      { name: "James Liu", role: "Treasurer", grade: "11" }
    ],
    updates: [
      {
        id: "r-u1",
        date: "2026-05-10",
        type: "recap",
        title: "State Championship — 3rd Place Finish!",
        content: "We placed 3rd at the Washington State Robotics Championship this weekend! Huge congratulations to every member for an incredible build season. Special recognition to our programming team for flawless autonomous routines and to our drive team for clutch performances under pressure. We couldn't be prouder.",
        author: "Club President"
      },
      {
        id: "r-u2",
        date: "2026-05-06",
        type: "agenda",
        title: "Meeting Agenda — May 6",
        content: "1. Post-season debrief & lessons learned\n2. Robot maintenance and off-season storage\n3. Officer nominations for 2026–27\n4. Summer workshop planning\n5. Open Q&A for incoming members",
        author: "VP of Operations"
      }
    ],
    nextMeeting: {
      date: "2026-05-20",
      items: ["Officer elections for 2026–27", "Summer skills workshops sign-up", "FRC off-season events interest survey", "Open build time"]
    }
  },
  {
    id: "science-olympiad",
    name: "Science Olympiad",
    category: "science",
    tagline: "23 events. One team.",
    description: "Science Olympiad is an academic competition team where students compete in 23 STEM events spanning biology, chemistry, physics, earth science, engineering, and more. Members specialize in 2–3 events and collaborate as a team to earn trophies at invitational, regional, and state tournaments.",
    advisor: "Ms. Patel",
    advisorEmail: "spatel@bsd405.org",
    meetingDays: "Mondays & Wednesdays",
    meetingTime: "3:15 PM – 5:30 PM",
    meetingLocation: "Room C-108",
    requirements: [
      "Tryouts held in September — open to all grades",
      "15-member competitive team + alternates",
      "Each member commits to 2–3 events and regular practice"
    ],
    howToJoin: "Tryouts are in September. Follow our Instagram for announcements. Off-season study sessions are open to anyone interested in joining next year.",
    contactEmail: "sciolympiad@interlake.example",
    instagram: "@interlakescio",
    members: 30,
    featured: true,
    officers: [
      { name: "Aisha Okonkwo", role: "Team Captain", grade: "12", email: "aokonkwo@interlake.example" },
      { name: "Ryan Zhang", role: "Co-Captain", grade: "12" },
      { name: "Lily Hoffman", role: "Secretary", grade: "11" },
      { name: "Dev Kapoor", role: "Treasurer", grade: "10" }
    ],
    updates: [
      {
        id: "so-u1",
        date: "2026-05-08",
        type: "recap",
        title: "State Invitational Results",
        content: "Interlake placed 5th overall at the WASO State Invitational! Top individual event finishes: 1st in Disease Detectives, 2nd in Forensics, 3rd in Circuit Lab. Amazing work from everyone — we're on track for a strong State Championship run.",
        author: "Team Captain"
      }
    ],
    nextMeeting: {
      date: "2026-05-18",
      items: ["State Championship prep — event rotations", "Experimental design practice (Bio/Chem)", "Build event check-ins: Towers, Wright Stuff", "Schedule review for the final 2 weeks"]
    }
  },
  {
    id: "model-un",
    name: "Model United Nations",
    category: "diplomatic",
    tagline: "Debate global issues. Forge solutions.",
    description: "Model UN simulates the United Nations, with members acting as delegates representing different countries in committee debates on global topics. Members research international issues, write position papers, practice public speaking, and compete at regional and national MUN conferences.",
    advisor: "Mr. Williams",
    advisorEmail: "kwilliams@bsd405.org",
    meetingDays: "Thursdays",
    meetingTime: "3:15 PM – 4:30 PM",
    meetingLocation: "Room A-112",
    requirements: [
      "Open to grades 10–12 (9th graders by application)",
      "Complete one practice committee before attending a conference",
      "Write one position paper per conference attended"
    ],
    howToJoin: "Attend any Thursday meeting. New members go through a 3-week intro to parliamentary procedure before joining the main committee.",
    contactEmail: "modelun@interlake.example",
    instagram: "@interlakemun",
    members: 38,
    featured: true,
    officers: [
      { name: "Isabella Ferrara", role: "Secretary-General", grade: "12", email: "iferrara@interlake.example" },
      { name: "Nathan Osei", role: "Deputy Secretary-General", grade: "11" },
      { name: "Chloe Nakamura", role: "Director of Conferences", grade: "11" },
      { name: "Tyler Brooks", role: "Treasurer", grade: "10" }
    ],
    updates: [
      {
        id: "mun-u1",
        date: "2026-05-09",
        type: "recap",
        title: "WMUN Conference Recap",
        content: "Congratulations to our delegates at the Washington Model UN Conference! We earned Best Delegate in the Human Rights Committee and Outstanding Delegate in SPECPOL. 12 members attended — our largest delegation yet.",
        author: "Secretary-General"
      }
    ],
    nextMeeting: {
      date: "2026-05-21",
      items: ["NAIMUN conference debrief", "Next year officer applications", "Topic selection for fall season", "Workshop: resolution writing 101"]
    }
  },
  {
    id: "debate",
    name: "Debate Club",
    category: "diplomatic",
    tagline: "Argue with evidence. Win with logic.",
    description: "Interlake Debate competes in Lincoln-Douglas (LD) and Public Forum (PF) formats at tournaments across Washington and nationally. Members develop research, argumentation, rebuttal, and public speaking skills. Regular practice rounds prepare competitors for NSDA-sanctioned tournaments.",
    advisor: "Ms. Garcia",
    advisorEmail: "mgarcia@bsd405.org",
    meetingDays: "Tuesdays & Fridays",
    meetingTime: "3:00 PM – 5:00 PM",
    meetingLocation: "Room A-203",
    requirements: [
      "Open to all grades",
      "New members complete a 2-week orientation",
      "Compete in at least 2 tournaments per season"
    ],
    howToJoin: "Email the club or show up on any Tuesday. No debate experience needed — our coaches train beginners from scratch.",
    contactEmail: "debate@interlake.example",
    instagram: "@interlakedebate",
    members: 41,
    featured: false,
    officers: [
      { name: "Jordan Whitfield", role: "President", grade: "12", email: "jwhitfield@interlake.example" },
      { name: "Mei-Ling Tran", role: "Vice President", grade: "11" },
      { name: "Caleb Moss", role: "Secretary", grade: "10" },
      { name: "Anya Gupta", role: "Treasurer", grade: "11" },
      { name: "Finn O'Brien", role: "Tournament Director", grade: "12" }
    ],
    updates: [
      {
        id: "deb-u1",
        date: "2026-05-07",
        type: "recap",
        title: "Spring Invitational Results",
        content: "Our PF team went 5-1 at the Spring Classic and advanced to finals. Three LD debaters cleared to elimination rounds. Fantastic weekend — lots of hardware coming back to Interlake!",
        author: "Club Coach"
      }
    ],
    nextMeeting: {
      date: "2026-05-19",
      items: ["June tournament registration", "New topic release — LD & PF", "Novice scrimmages", "Judge training for alumni volunteers"]
    }
  },
  {
    id: "coding-club",
    name: "Coding Club",
    category: "engineering",
    tagline: "Write code. Build things. Ship it.",
    description: "Coding Club is a collaborative space for students interested in software development, web design, machine learning, and competitive programming. Members work on personal and group projects, prepare for USACO competitions, and participate in hackathons like HackHS and Congressional App Challenge.",
    advisor: "Mr. Chen",
    advisorEmail: "achen@bsd405.org",
    meetingDays: "Wednesdays",
    meetingTime: "3:15 PM – 5:00 PM",
    meetingLocation: "Computer Lab D-110",
    requirements: [
      "Open to all grades and experience levels",
      "Beginners start in the intro track (HTML/CSS/Python)",
      "Intermediate/advanced members choose project tracks"
    ],
    howToJoin: "Walk in on any Wednesday. Bring your laptop if you have one (loaners available).",
    contactEmail: "codingclub@interlake.example",
    instagram: "@interlakecode",
    members: 65,
    featured: true,
    officers: [
      { name: "Samira Haddad", role: "President", grade: "12", email: "shaddad@interlake.example" },
      { name: "Kevin Wu", role: "VP of Projects", grade: "11" },
      { name: "Zoe Larsen", role: "VP of Competitions", grade: "11" },
      { name: "Diego Reyes", role: "Secretary", grade: "10" },
      { name: "Preethi Iyer", role: "Treasurer", grade: "10" }
    ],
    updates: [
      {
        id: "cc-u1",
        date: "2026-05-11",
        type: "recap",
        title: "HackHS 2026 — Our Teams Shine",
        content: "Two Interlake teams competed at HackHS 2026. Team 'Byte Brigade' won Best Education App for their AI tutoring assistant. Team 'The Stack' placed 2nd in Social Impact. Proud of everyone who participated!",
        author: "Club Officers"
      },
      {
        id: "cc-u2",
        date: "2026-05-04",
        type: "agenda",
        title: "Meeting Notes — May 4",
        content: "1. HackHS debrief and project showcases\n2. USACO June contest prep — register by May 25\n3. Congressional App Challenge kickoff\n4. Intro track: JavaScript DOM manipulation\n5. Advanced track: ML model deployment with Flask",
        author: "President"
      }
    ],
    nextMeeting: {
      date: "2026-05-20",
      items: ["Congressional App Challenge team formation", "USACO Bronze/Silver strategy session", "Web dev track: React intro", "Project expo planning for June"]
    }
  },
  {
    id: "math-team",
    name: "Math Team",
    category: "engineering",
    tagline: "Solve harder problems.",
    description: "Interlake Math Team competes in AMC 10/12, AIME, ARML, and Washington state math competitions. Members study advanced topics including combinatorics, number theory, algebra, and geometry. We're known for producing USAMO qualifiers and strong AMC scores.",
    advisor: "Dr. Kim",
    advisorEmail: "hkim@bsd405.org",
    meetingDays: "Mondays",
    meetingTime: "3:15 PM – 4:45 PM",
    meetingLocation: "Room B-118",
    requirements: [
      "Open to all grades",
      "No prerequisite score required — all levels welcome",
      "AMC/MATHCOUNTS experience recommended for varsity track"
    ],
    howToJoin: "Come to any Monday meeting. All skill levels welcome. Varsity and JV tracks available.",
    contactEmail: "mathteam@interlake.example",
    members: 48,
    featured: false,
    officers: [
      { name: "Lena Vasquez", role: "Team Lead", grade: "12", email: "lvasquez@interlake.example" },
      { name: "Aaron Shi", role: "Vice Lead", grade: "12" },
      { name: "Claire Johansson", role: "Secretary", grade: "11" },
      { name: "Ravi Menon", role: "Treasurer", grade: "10" }
    ],
    updates: [
      {
        id: "mt-u1",
        date: "2026-05-01",
        type: "recap",
        title: "State Math Championship — 2nd Place",
        content: "Interlake placed 2nd at the Washington State High School Math Championship! Two members earned individual top-10 finishes. Our relay team set a new school record. Incredible performance by all.",
        author: "Team Lead"
      }
    ],
    nextMeeting: {
      date: "2026-05-18",
      items: ["ARML team selection announcement", "AMC prep: combinatorics sprint", "Summer math camp info session", "Problem set review"]
    }
  },
  {
    id: "environmental-club",
    name: "Environmental Club",
    category: "science",
    tagline: "Act locally. Think globally.",
    description: "Environmental Club organizes campus sustainability initiatives, local ecosystem restoration projects, and climate advocacy campaigns. Members run the school recycling program, coordinate beach and trail cleanups, and lobby for environmental policy at the district level.",
    advisor: "Ms. Torres",
    advisorEmail: "ltorres@bsd405.org",
    meetingDays: "Fridays",
    meetingTime: "3:15 PM – 4:15 PM",
    meetingLocation: "Room C-205",
    requirements: [
      "Open to all grades",
      "No prior experience needed",
      "Participate in at least 2 service events per semester"
    ],
    howToJoin: "Join any Friday meeting or sign up through the school activity form.",
    contactEmail: "envclub@interlake.example",
    instagram: "@interlakegreen",
    members: 34,
    featured: false,
    officers: [
      { name: "Mia Johansson", role: "Co-President", grade: "12", email: "mjohansson@interlake.example" },
      { name: "Omar Farouk", role: "Co-President", grade: "12" },
      { name: "Tessa Williams", role: "Secretary", grade: "11" },
      { name: "Ben Castillo", role: "Treasurer", grade: "10" },
      { name: "Yuki Tanaka", role: "Outreach Coordinator", grade: "11" }
    ],
    updates: [
      {
        id: "env-u1",
        date: "2026-05-09",
        type: "recap",
        title: "Earth Month Cleanup — 400 lbs Collected",
        content: "Our Earth Month cleanup at Mercer Slough was a huge success! 47 volunteers collected over 400 lbs of litter. We also planted 60 native plants along the wetland trail. Thank you to everyone who came out.",
        author: "Club Co-President"
      }
    ],
    nextMeeting: {
      date: "2026-05-22",
      items: ["End-of-year campus composting review", "Summer internship opportunities (WA Dept. of Ecology)", "Planning for zero-waste graduation initiative", "Student government sustainability resolution — next steps"]
    }
  },
  {
    id: "drama-club",
    name: "Drama Club",
    category: "creative",
    tagline: "Take the stage.",
    description: "Interlake Drama Club produces two full theatrical productions per year — a fall play and a spring musical — plus student-directed one-act shows. Members participate in acting, directing, stagecraft, costuming, lighting, sound, and marketing. No audition required for crew positions.",
    advisor: "Ms. Rivera",
    advisorEmail: "arivera@bsd405.org",
    meetingDays: "Mondays, Wednesdays & Fridays",
    meetingTime: "3:15 PM – 6:00 PM (production weeks vary)",
    meetingLocation: "Black Box Theater, Building A",
    requirements: [
      "Cast roles require spring/fall auditions",
      "Crew positions are open year-round, no audition",
      "Full commitment expected 3 weeks before show dates"
    ],
    howToJoin: "For crew: show up Monday. For acting: attend auditions (announced on Instagram). Anyone can help with front-of-house, marketing, or set painting.",
    contactEmail: "drama@interlake.example",
    instagram: "@interlakedrama",
    members: 70,
    featured: true,
    officers: [
      { name: "Grace Kim", role: "President", grade: "12", email: "gkim@interlake.example" },
      { name: "Elijah Foster", role: "Vice President", grade: "11" },
      { name: "Nadia Patel", role: "Stage Manager", grade: "11" },
      { name: "Leo Santana", role: "Treasurer", grade: "10" },
      { name: "Alicia Chen", role: "Publicity Chair", grade: "10" }
    ],
    updates: [
      {
        id: "dr-u1",
        date: "2026-05-12",
        type: "recap",
        title: "Spring Musical — 'Into the Woods' Opens Tonight",
        content: "'Into the Woods' runs May 12–14. Tickets available at the door or online. This has been an incredible production — months of hard work from our 45-person cast and crew. Come support your fellow students!",
        author: "Director"
      }
    ],
    nextMeeting: {
      date: "2026-05-18",
      items: ["Post-show debrief and celebration", "Fall show selection vote", "Summer drama camp info", "Tech crew portfolio workshop"]
    }
  },
  {
    id: "key-club",
    name: "Key Club",
    category: "service",
    tagline: "Lead. Serve. Build.",
    description: "Key Club is the largest student-led service organization at Interlake, affiliated with Kiwanis International. Members complete community service hours, lead volunteer events, and develop leadership skills through district and international conventions.",
    advisor: "Mr. Park",
    advisorEmail: "jpark@bsd405.org",
    meetingDays: "Tuesdays",
    meetingTime: "7:15 AM – 7:50 AM",
    meetingLocation: "Room A-101",
    requirements: [
      "Open to all grades",
      "50 service hours per year recommended for active status",
      "$15 annual dues to Kiwanis International"
    ],
    howToJoin: "Sign up at any Tuesday meeting or through the school activity portal.",
    contactEmail: "keyclub@interlake.example",
    instagram: "@interlakekeyclub",
    members: 120,
    featured: false,
    officers: [
      { name: "Simone Adeyemi", role: "President", grade: "12", email: "sadeyemi@interlake.example" },
      { name: "Patrick Nguyen", role: "Vice President", grade: "11" },
      { name: "Hannah Berg", role: "Secretary", grade: "11" },
      { name: "Marcus Thompson", role: "Treasurer", grade: "10" },
      { name: "Jade Morales", role: "Service Chair", grade: "11" }
    ],
    updates: [
      {
        id: "kc-u1",
        date: "2026-05-08",
        type: "recap",
        title: "Food Bank Drive — 1,200 Items Donated",
        content: "Our spring food bank drive collected 1,200+ non-perishable items for the Bellevue Food Bank. This is a new Interlake Key Club record! Thank you to every student, teacher, and family who donated.",
        author: "Club President"
      }
    ],
    nextMeeting: {
      date: "2026-05-19",
      items: ["District convention registration", "End-of-year service hour tally", "Officer elections for 2026–27", "Summer service project planning"]
    }
  },
  {
    id: "literary-magazine",
    name: "Literary Magazine",
    category: "creative",
    tagline: "Write. Create. Publish.",
    description: "Interlake's literary magazine publishes student poetry, prose, visual art, and photography in an annual print edition. The editorial team reviews submissions, designs the layout, and coordinates publication. We also host open mic nights and writing workshops throughout the year.",
    advisor: "Mr. Nakamura",
    advisorEmail: "tnakamura@bsd405.org",
    meetingDays: "Wednesdays",
    meetingTime: "3:15 PM – 4:30 PM",
    meetingLocation: "Room A-205",
    requirements: [
      "Open to all grades",
      "Writers submit work for consideration; editors apply in spring",
      "Art/photography submissions accepted year-round"
    ],
    howToJoin: "Submit work via our Google Form (linked on Instagram) or attend any Wednesday meeting.",
    contactEmail: "litmagzine@interlake.example",
    instagram: "@interlakelitmag",
    members: 28,
    featured: false,
    officers: [
      { name: "Vivian Lu", role: "Editor-in-Chief", grade: "12", email: "vlu@interlake.example" },
      { name: "Sam Porter", role: "Managing Editor", grade: "11" },
      { name: "Aria Singh", role: "Art Director", grade: "11" },
      { name: "Cole Martinson", role: "Treasurer", grade: "10" }
    ],
    updates: [
      {
        id: "lm-u1",
        date: "2026-05-11",
        type: "recap",
        title: "Spring Edition Now Available!",
        content: "The 2026 Spring Edition of 'Echoes' is here! Pick up a copy in the main office or library. This issue features 84 pages of poetry, fiction, essays, and art from 32 student contributors. Incredible work this year.",
        author: "Editor-in-Chief"
      }
    ],
    nextMeeting: {
      date: "2026-05-20",
      items: ["Spring edition celebration", "Submissions open for fall edition", "Editor applications for 2026–27", "Open mic night planning — June 5"]
    }
  },
  {
    id: "asian-student-union",
    name: "Asian Student Union",
    category: "cultural",
    tagline: "Community. Culture. Advocacy.",
    description: "ASU celebrates the diversity of Asian and Pacific Islander cultures at Interlake while fostering community and advocacy. We host cultural events, heritage nights, community speakers, and work with administration on AAPI-related equity initiatives.",
    advisor: "Ms. Lee",
    advisorEmail: "jlee@bsd405.org",
    meetingDays: "Thursdays",
    meetingTime: "3:15 PM – 4:30 PM",
    meetingLocation: "Room B-209",
    requirements: [
      "Open to all students — any background welcome",
      "No requirements, just enthusiasm!"
    ],
    howToJoin: "Come to any Thursday meeting. Everyone is welcome regardless of background.",
    contactEmail: "asu@interlake.example",
    instagram: "@interlakeasu",
    members: 88,
    featured: false,
    officers: [
      { name: "Michelle Yeh", role: "Co-President", grade: "12", email: "myeh@interlake.example" },
      { name: "David Hong", role: "Co-President", grade: "12" },
      { name: "Priya Sharma", role: "Secretary", grade: "11" },
      { name: "Jason Lim", role: "Treasurer", grade: "10" },
      { name: "Angela Park", role: "Events Chair", grade: "11" }
    ],
    updates: [
      {
        id: "asu-u1",
        date: "2026-05-02",
        type: "recap",
        title: "AAPI Heritage Month Kickoff Event",
        content: "Over 200 students attended our AAPI Heritage Month kickoff! We had cultural performances, traditional food, and a keynote from local AAPI community leader Dr. Yuen. One of our best events yet.",
        author: "Co-President"
      }
    ],
    nextMeeting: {
      date: "2026-05-21",
      items: ["Heritage Night debrief", "End-of-year celebration planning", "Officer elections", "Next year's event calendar brainstorm"]
    }
  },
  {
    id: "nhs",
    name: "National Honor Society",
    category: "leadership",
    tagline: "Scholarship. Service. Leadership. Character.",
    description: "NHS recognizes students who demonstrate outstanding achievement in academics, service, leadership, and character. Members coordinate tutoring programs, lead service initiatives, and represent Interlake at state NHS conferences.",
    advisor: "Ms. Johnson",
    advisorEmail: "sjohnson@bsd405.org",
    meetingDays: "First & Third Tuesdays",
    meetingTime: "3:15 PM – 4:00 PM",
    meetingLocation: "Room A-118",
    requirements: [
      "Minimum 3.5 unweighted GPA",
      "Application and faculty review required (Grades 10–12)",
      "20 service hours per semester to maintain membership"
    ],
    howToJoin: "Applications open in October for juniors/seniors and in spring for sophomores. Check with Ms. Johnson for the current cycle.",
    contactEmail: "nhs@interlake.example",
    members: 95,
    featured: false,
    officers: [
      { name: "Rachel Kim", role: "President", grade: "12", email: "rkim@interlake.example" },
      { name: "Tyler Evans", role: "Vice President", grade: "11" },
      { name: "Sophia Delgado", role: "Secretary", grade: "11" },
      { name: "Andrew Cho", role: "Treasurer", grade: "10" }
    ],
    updates: [
      {
        id: "nhs-u1",
        date: "2026-05-07",
        type: "recap",
        title: "Spring Induction Ceremony",
        content: "Welcome to our 28 newest NHS members inducted at the Spring Ceremony! Congratulations to all inductees and their families. We look forward to your leadership and service contributions next year.",
        author: "NHS President"
      }
    ],
    nextMeeting: {
      date: "2026-05-19",
      items: ["Senior farewell and recognition", "Service hour final submissions deadline", "Officer elections for 2026–27", "Summer service opportunities"]
    }
  },
  {
    id: "film-club",
    name: "Film Club",
    category: "creative",
    tagline: "Lights. Camera. Create.",
    description: "Film Club is a production and appreciation collective where students write, direct, shoot, and edit short films. We host an annual Film Festival and submit to regional student film competitions. Members also analyze cinema history and critique contemporary films.",
    advisor: "Mr. Okafor",
    advisorEmail: "cokafor@bsd405.org",
    meetingDays: "Fridays",
    meetingTime: "3:15 PM – 5:00 PM",
    meetingLocation: "Media Center",
    requirements: [
      "Open to all grades",
      "Beginners welcome — equipment training provided",
      "Each member contributes to at least one film project per semester"
    ],
    howToJoin: "Come Friday to the Media Center. Cameras, tripods, and editing software are all provided.",
    contactEmail: "filmclub@interlake.example",
    instagram: "@interlakefilm",
    members: 22,
    featured: false,
    officers: [
      { name: "Olivia Strand", role: "Chair", grade: "12", email: "ostrand@interlake.example" },
      { name: "Noah Pham", role: "Vice Chair", grade: "11" },
      { name: "Emma Kowalski", role: "Secretary", grade: "10" },
      { name: "Lucas Rivera", role: "Equipment Manager", grade: "11" }
    ],
    updates: [
      {
        id: "fc-u1",
        date: "2026-05-09",
        type: "recap",
        title: "Spring Film Festival — Full House!",
        content: "Our Spring Film Festival screened 8 student films to a packed audience. Best Film went to 'The Last Stop' by junior director Maya L. Best Documentary went to 'Roots' by the sophomore team. Congrats to all filmmakers!",
        author: "Club Chair"
      }
    ],
    nextMeeting: {
      date: "2026-05-22",
      items: ["Festival recap and feedback", "Summer film project pitches", "Equipment checkout for summer loans", "Film analysis: discuss 'Everything Everywhere All at Once'"]
    }
  },
  {
    id: "peer-tutoring",
    name: "Peer Tutoring Program",
    category: "leadership",
    tagline: "Learn better together.",
    description: "Peer Tutoring connects students who want academic help with trained student tutors. We cover all core subjects: math (through AP Calc BC), science (bio, chem, physics), English, history, and foreign languages. All tutors complete a 4-hour training program.",
    advisor: "Ms. Huang",
    advisorEmail: "yhuang@bsd405.org",
    meetingDays: "Mon–Thu (tutoring hours)",
    meetingTime: "3:15 PM – 4:30 PM",
    meetingLocation: "Library, Room 2",
    requirements: [
      "Tutors: 3.7+ GPA in subject, teacher recommendation",
      "Students seeking help: open to all, no requirements",
      "Tutors earn NHS-eligible service hours"
    ],
    howToJoin: "Students needing help: sign up at the library or online. Prospective tutors: apply via the Google Form linked on our Instagram.",
    contactEmail: "peertutoring@interlake.example",
    members: 60,
    featured: false,
    officers: [
      { name: "Daniel Osei", role: "Program Coordinator", grade: "12", email: "dosei@interlake.example" },
      { name: "Kavya Reddy", role: "Deputy Coordinator", grade: "11" },
      { name: "Max Lindberg", role: "Secretary", grade: "11" },
      { name: "Jasmine Lee", role: "Treasurer", grade: "10" },
      { name: "Ethan Cross", role: "Tutor Training Lead", grade: "12" }
    ],
    updates: [
      {
        id: "pt-u1",
        date: "2026-05-10",
        type: "recap",
        title: "AP Exam Prep Blitz — 200 Sessions Held",
        content: "In the two weeks before AP exams, our tutors held 200+ sessions helping students prep for 14 different AP subjects. Huge thanks to our 45 tutors who gave their time. Look for our AP results survey in June!",
        author: "Program Coordinator"
      }
    ],
    nextMeeting: {
      date: "2026-05-19",
      items: ["End-of-year tutor appreciation", "Tutor applications for 2026–27 now open", "Final exam tutoring schedule (June 1–10)", "New tutor training session — May 27"]
    }
  }
];

const DEFAULT_EVENTS = [
  {
    id: "ev1",
    title: "Spring Club Fair",
    date: "2026-05-20",
    time: "11:00 AM – 1:00 PM",
    location: "Main Gymnasium",
    description: "All clubs set up tables to recruit new members and showcase what they do. Come explore dozens of Interlake clubs, pick up info, and sign up for the ones that interest you!",
    category: "all-school",
    tags: ["Clubs", "Recruiting", "All Students"]
  },
  {
    id: "ev2",
    title: "Drama Spring Musical — 'Into the Woods'",
    date: "2026-05-13",
    time: "7:00 PM – 9:30 PM",
    location: "Interlake Performing Arts Center",
    description: "Final performance of the spring musical, 'Into the Woods.' Tickets available at the door. Come support your fellow students!",
    category: "arts",
    tags: ["Drama", "Music", "Performance"]
  },
  {
    id: "ev3",
    title: "Literary Magazine Open Mic Night",
    date: "2026-06-05",
    time: "6:30 PM – 8:30 PM",
    location: "Library Commons",
    description: "Students share original poetry, prose, and spoken word. All are welcome to perform or simply listen. Free admission.",
    category: "arts",
    tags: ["Writing", "Poetry", "Open Mic"]
  },
  {
    id: "ev4",
    title: "Science Olympiad State Championship",
    date: "2026-05-30",
    time: "8:00 AM – 6:00 PM",
    location: "University of Washington",
    description: "Interlake's Science Olympiad team competes at the WA State Championship. Come cheer them on!",
    category: "competition",
    tags: ["Science", "Competition", "STEM"]
  },
  {
    id: "ev5",
    title: "NHS End-of-Year Service Award Ceremony",
    date: "2026-06-03",
    time: "5:30 PM – 7:00 PM",
    location: "Room A-118",
    description: "Annual ceremony recognizing top NHS service contributors. Students who completed 50+ service hours this year will be honored.",
    category: "leadership",
    tags: ["NHS", "Service", "Leadership"]
  },
  {
    id: "ev6",
    title: "ARML Team Practice Tournament",
    date: "2026-05-24",
    time: "9:00 AM – 12:00 PM",
    location: "Room B-118",
    description: "Math Team hosts a mini tournament to prep for ARML nationals. Open to Math Team members. Contact Dr. Kim for details.",
    category: "competition",
    tags: ["Math", "Competition", "STEM"]
  },
  {
    id: "ev7",
    title: "Coding Club Project Expo",
    date: "2026-06-10",
    time: "3:15 PM – 5:30 PM",
    location: "Computer Lab D-110",
    description: "Coding Club members demo their semester projects — apps, games, ML models, and websites. Open to all students and staff.",
    category: "stem",
    tags: ["Coding", "Demo Day", "Tech"]
  },
  {
    id: "ev8",
    title: "Environmental Club Trail Cleanup",
    date: "2026-05-23",
    time: "9:00 AM – 12:00 PM",
    location: "Coal Creek Trail Trailhead",
    description: "Community trail cleanup and native plant installation. Wear old clothes and sturdy shoes. Gloves and bags provided. Lunch included for volunteers!",
    category: "service",
    tags: ["Environment", "Service", "Community"]
  },
  {
    id: "ev9",
    title: "AAPI Heritage Night",
    date: "2026-05-28",
    time: "6:00 PM – 9:00 PM",
    location: "Main Gymnasium",
    description: "Interlake's annual AAPI Heritage Night featuring cultural performances, traditional food, art installations, and community speakers. Free admission — all welcome!",
    category: "cultural",
    tags: ["Culture", "AAPI", "Celebration"]
  },
  {
    id: "ev10",
    title: "Robotics Off-Season Build Day",
    date: "2026-06-07",
    time: "10:00 AM – 4:00 PM",
    location: "Room B-214",
    description: "Open build day for current and incoming Robotics Club members. Work on off-season projects, learn new skills, and meet the team. Lunch provided.",
    category: "stem",
    tags: ["Robotics", "Engineering", "STEM"]
  }
];

// ── Data Access Helpers ──────────────────────────────────────────────────────

function getClubs() {
  try {
    const stored = localStorage.getItem("hub_clubs");
    return stored ? JSON.parse(stored) : DEFAULT_CLUBS;
  } catch {
    return DEFAULT_CLUBS;
  }
}

function saveClubs(clubs) {
  localStorage.setItem("hub_clubs", JSON.stringify(clubs));
}

function getEvents() {
  try {
    const stored = localStorage.getItem("hub_events");
    return stored ? JSON.parse(stored) : DEFAULT_EVENTS;
  } catch {
    return DEFAULT_EVENTS;
  }
}

function getClubById(id) {
  return getClubs().find(c => c.id === id) || null;
}

function addUpdateToClub(clubId, update) {
  const clubs = getClubs();
  const club = clubs.find(c => c.id === clubId);
  if (!club) return false;
  if (!club.updates) club.updates = [];
  club.updates.unshift({ ...update, id: "u-" + Date.now() });
  saveClubs(clubs);
  return true;
}

const CATEGORIES = [
  { id: "all",        label: "All Clubs",    color: "#3292C9" },
  { id: "engineering",label: "Engineering",  color: "#3292C9" },
  { id: "science",    label: "Science",      color: "#3292C9" },
  { id: "diplomatic", label: "Diplomatic",   color: "#3292C9" },
  { id: "creative",   label: "Creative",     color: "#3292C9" },
  { id: "service",    label: "Service",      color: "#3292C9" },
  { id: "cultural",   label: "Cultural",     color: "#3292C9" },
  { id: "leadership", label: "Leadership",   color: "#3292C9" }
];

function getCategoryColor(catId) {
  const cat = CATEGORIES.find(c => c.id === catId);
  return cat ? cat.color : "#64748b";
}

function getCategoryLabel(catId) {
  const cat = CATEGORIES.find(c => c.id === catId);
  return cat ? cat.label : catId;
}

function formatDate(dateStr) {
  if (!dateStr) return "";
  const d = new Date(dateStr + "T00:00:00");
  return d.toLocaleDateString("en-US", { weekday: "short", month: "long", day: "numeric", year: "numeric" });
}

function formatDateShort(dateStr) {
  if (!dateStr) return "";
  const d = new Date(dateStr + "T00:00:00");
  return d.toLocaleDateString("en-US", { month: "short", day: "numeric" });
}

function getUpdateBadgeColor(type) {
  if (type === "recap") return "#10b981";
  if (type === "agenda") return "#3b82f6";
  if (type === "announcement") return "#f59e0b";
  return "#64748b";
}

function daysUntil(dateStr) {
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const target = new Date(dateStr + "T00:00:00");
  return Math.round((target - today) / (1000 * 60 * 60 * 24));
}

function getClubMeetingDays(club) {
  if (!club || !club.meetingDays) return [];
  const s = club.meetingDays.toLowerCase();
  const days = [];
  if (s.includes('sun')) days.push(0);
  if (s.includes('mon')) days.push(1);
  if (s.includes('tue')) days.push(2);
  if (s.includes('wed')) days.push(3);
  if (s.includes('thu')) days.push(4);
  if (s.includes('fri')) days.push(5);
  if (s.includes('sat')) days.push(6);
  return days;
}
