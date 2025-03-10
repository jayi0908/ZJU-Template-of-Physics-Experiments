#import "@preview/tablex:0.0.9": tablex

#let state_type = state("type", none) // 报告类型
#let state_experiment = state("experiment", none)
#let state_table = state("table", none)
#let state_teacher = state("teacher", none)
#let state_class = state("class", none)
#let state_author = state("author", none)
#let state_school_id = state("school_id", none)
#let state_date = state("date", none)
#let state_day = state("day", none)

#let _underlined_cell(content, color: black) = {
  tablex(
    align: center + horizon,
    stroke: 0pt,
    inset: 0.65em,
    map-hlines: h => {
      if (h.y > 0) {
        (..h, stroke: 0.5pt + color)
      } else {
        h
      }
    },
    columns: 1fr,
    content,
  )
}

#let fakebold(content) = {
  set text(stroke: 0.02857em) // https://gist.github.com/csimide/09b3f41e838d5c9fc688cc28d613229f
  content
}

#let project(
  type: none,
  experiment: none,
  table: none,
  teacher: none,
  class: none,
  author: none,
  school_id: none,
  date: none,
  day: none,

  body,
) = {
  set page(numbering: "1", number-align: center)

  set text(font: "SimSun", size: 12pt)
  // show raw: set text(font: font_mono)
  show math.equation: set text(weight: 400)

  set par(spacing: 1.2em, leading: 0.75em)

  // Update global state
  state_type.update(project)
  state_experiment.update(experiment)
  state_table.update(table)
  state_teacher.update(teacher)
  state_class.update(class)
  state_author.update(author)
  state_school_id.update(school_id)
  state_date.update(date)
  state_day.update(day)

  // Cover Page
  if (type == "shiyan"){
    v(6em)
    align(center)[
      #set text(size: 40pt)
      #fakebold[物理实验报告]
    ]

    v(7em)
    let rows_1 = ()
    if (experiment != none) {
      rows_1.push([
        #set text(size: 17pt)
        #fakebold[实验名称]
      ])
      rows_1.push(experiment)
    }
    if (experiment != none) {
      rows_1.push([
        #set text(size: 17pt)
        #fakebold[实验桌号]
      ])
      rows_1.push(table)
    }
    if (teacher != none) {
      rows_1.push([
        #set text(size: 17pt)
        #fakebold[指导教师]
      ])
      rows_1.push(teacher)
    }
    align(
      center,
      box(width: 75%)[
        #set text(size: 1.2em)
        #tablex(
          columns: (8em, 1fr),
          align: center + top,
          stroke: 0pt,
          inset: 1pt,
          map-cells: cell => {
            if (cell.x == 0) {
              _underlined_cell([#cell.content#"："], color: white)
            } else {
              _underlined_cell(cell.content, color: black)
            }
          },
          ..rows_1,
        )
      ],
    )
  } else if (type == "yuxi"){
    v(6em)
    align(center)[
      #set text(size: 40pt)
      #fakebold[物理预习实验报告]
    ]

    v(7em)
    let rows_1 = ()
    if (experiment != none) {
      rows_1.push([
        #set text(size: 17pt)
        #fakebold[实验名称]
      ])
      rows_1.push(experiment)
    }
    if (teacher != none) {
      rows_1.push([
        #set text(size: 17pt)
        #fakebold[指导教师]
      ])
      rows_1.push(teacher)
    }
    align(
      center,
      box(width: 75%)[
        #set text(size: 1.2em)
        #tablex(
          columns: (8em, 1fr),
          align: center + top,
          stroke: 0pt,
          inset: 1pt,
          map-cells: cell => {
            if (cell.x == 0) {
              _underlined_cell([#cell.content#"："], color: white)
            } else {
              _underlined_cell(cell.content, color: black)
            }
          },
          ..rows_1,
        )
      ],
    )
  }

  v(4em)
  let rows_2 = ()
  if(class != none){
    rows_2.push([
      #set text(size: 15pt)
      #fakebold[班级]
    ])
    rows_2.push(class)
  }
  if (author != none) {
    rows_2.push([
      #set text(size: 15pt)
      #fakebold[姓名]
    ])
    rows_2.push(author)
  }
  if (school_id != none) {
    rows_2.push([
      #set text(size: 15pt)
      #fakebold[学号]
    ])
    rows_2.push(school_id)
  }
  align(
    center,
    box(width: 75%)[
      #set text(size: 1.2em)
      #tablex(
        columns: (8em, 15em),
        align: center + top,
        stroke: 0pt,
        inset: 1pt,
        map-cells: cell => {
          if (cell.x == 0) {
            _underlined_cell([#cell.content#"："], color: white)
          } else {
            _underlined_cell(cell.content, color: black)
          }
        },
        ..rows_2,
      )
    ],
  )

  v(2em)
  let rows_3 = ()
  if(date != none and day != none){
    rows_3.push([
      #set text(size: 15pt)
      #fakebold[实验日期]
    ])
    rows_3.push(date)
    rows_3.push(day)
  }
  align(
    center,
    box(width: 75%)[
      #set text(size: 1.2em)
      #tablex(
        columns: (5.5em, 9em, 8em),
        align: (center, left, right),
        stroke: 0pt,
        inset: 1pt,
        map-cells: cell => {
          if (cell.x == 0) {
            [#cell.content#"："]
          } else if (cell.x == 1) {
            cell.content
          } else {
            cell.content
          }
        },
        ..rows_3,
      )
    ],
  )

  v(2em)

  align(center)[
    #set text(size: 15pt)
    浙江大学物理实验教学中心
  ]
  pagebreak()

  set par(justify: true)

  set heading(
    numbering: (..args) => {
      let nums = args.pos()
      if nums.len() == 1 {
        return none
      } else if nums.len() == 2 {
        return numbering("一、", ..nums.slice(1))
      } else {
        return numbering("1.", ..nums.slice(2))
      }
    },
  )
  show heading.where(level: 1): it => block(
    width: 100%,
    {
      set text(
        size: 1.2em, 
        stroke: 0.01em
      )
      it.body
      v(0.6em)
    },
  )
  body
}

// 添加header，使得主文档中的标题表示更简单
#let header(
  tag: none,
) = {
  if (tag == "1") {
    align(left)[
      #[#set text(size: 14pt,font: "SimHei")
        #fakebold[== 预习报告]
      ]
      $space$（注：将已经写好的“物理实验预习报告”内容拷贝过来）
    ]
  } else if (tag == "1.1") {
    align(left)[
      #[#set text(size: 13pt)
        #fakebold[=== 实验综述]
      ]
      $space$（自述实验现象、实验原理和实验方法，不超过300字，5分）
      #v(1em)
    ]
  } else if (tag == "1.2") {
    align(left)[
      #[#set text(size: 13pt)
        #fakebold[=== 实验重点]
      ]
      $space$（简述本实验的学习重点，不超过100字，3分）
      #v(1em)
    ]
  } else if (tag == "1.3") {
    align(left)[
      #[#set text(size: 13pt)
        #fakebold[=== 实验难点]
      ]
      $space$（简述本实验的实现难点，不超过100字，2分）
      #v(1em)
    ]
  } else if (tag == "2") {
    align(left)[
      #[#set text(size: 14pt,font: "SimHei")
        #fakebold[== 原始数据]
      ]
      $space$（将有老师签名的“自备数据记录草稿纸”的扫描或手机拍摄图粘贴在下方，20分）
    ]
  } else if (tag == "3") {
    align(left)[
      #[#set text(size: 14pt,font: "SimHei")
        #fakebold[== 结果与分析]
      ]
    ]
  } else if (tag == "3.1") {
    align(left)[
      #[#set text(size: 13pt)
        #fakebold[=== 数据处理与结果]
      ]
      $space$（列出数据表格、选择数据处理方法、给定测量或计算结果，30分）
      #v(1em)
    ]
  } else if (tag == "3.2") {
    align(left)[
      #[#set text(size: 13pt)
        #fakebold[=== 误差分析]
      ]
      $space$（运用测量误差、相对误差、不确定度等分析实验结果，20分）
      #v(1em)
    ]
  } else if (tag == "3.3") {
    align(left)[
      #[#set text(size: 13pt)
        #fakebold[=== 实验探讨]
      ]
      $space$（对实验内容、现象和过程的小结，不超过100字，10分）
      #v(1em)
    ]
  } else if (tag == "4") {
    align(left)[
      #[#set text(size: 14pt,font: "SimHei")
        #fakebold[== 思考题]
      ]
      $space$（解答教材或讲义或老师布置的思考题，10分）
      #v(1em)
    ]
  }
}
