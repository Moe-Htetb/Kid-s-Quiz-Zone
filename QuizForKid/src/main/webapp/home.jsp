
<%@ include file="./assets/layout/header.jsp"%>
<%@ include file="./assets/layout/nav.jsp"%>
<%if(session.getAttribute("score")!=null && session.getAttribute("loginStudent")!=null) { 
	response.sendRedirect("certifi.jsp");
}
%>
 
  <header class="header position-relative mt-6 overflow-hidden">
      
      <div class="container position-relative z-3">
        <div class="row">
          <div class="col-lg-6">
            <div class="mt-4">
              <h1 class="xl-text">
                The <span class="text-success">Perfect</span> Kid's
                <span class="text-warning">Space</span>
              </h1>
              <p class="lead mb-4">
                We have 3 levels: Basic, Intermediate and Advanced <br>
                BASIC : Recommended for Grade- 5 to Grade-7. <br>
                Intermediate : Recommended for Grade- 8 to Grade-9. <br>
                Advanced: Recommended for Grade- 10 to Grade-12. <br>
                
                Have fun and good luck!
              </p>
              <a href="#introduction" class="btn btn-primary btn-lg m-2">
                More Details
              </a>
              <a href="#contact" class="btn btn-outline-secondary btn-lg m-2">
                Contact Us
              </a>
            </div>
          </div>
          <div class="col-lg-6 ">
            <div class="image-container">
              <img src="./assets/images/header1.png" alt="" class="img-fluid" />
            </div>
          </div>
        </div>
      </div>
    </header>
    
    <section id="classes">
      <div class="bg-light mt-7 mb-5 p-5">
        <div class="container">
          <div class="row justify-content-center">
            <!-- card1 -->
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
              <div class="card card1 border-0 p-1" style="max-height: 600px">
                <img
                  src="./assets/images/pngegg3.png"
                  class="card-img-top"
                  alt="..."
                  style="width: 100%"
                />
                <div class="card-body">
                  <h5 class="card-title">Basic</h5>
                  <p class="card-text text-white">
                   Start small, build strong foundations, and focus on learning the essentials.
                  </p>
                  <a href="quiz.jsp?levelid=1" class="btn btn-outline-light"
                    >Let's Get It <i class="fas fa-arrow-alt-circle-right"></i
                  ></a>
                </div>
              </div>
            </div>

            <!-- card2 -->
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
              <div class="card border-0 card2 p-1" style="max-height: 600px">
                <img
                  src="./assets/images/pngegg5.png"
                  class="card-img-top"
                  alt="..."
                  style="width: 100%"
                />
                <div class="card-body">
                  <h5 class="card-title">Intermediate</h5>
                  <p class="card-text text-white">
                    Challenge yourself with new concepts, apply your knowledge, and practice consistently.
                  </p>
                  <a href="quiz.jsp?levelid=2" class="btn btn-outline-light"
                    >Let's Get It <i class="fas fa-arrow-alt-circle-right"></i
                  ></a>
                </div>
              </div>
            </div>

            <!-- card3 -->
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
              <div class="card card3 border-0 p-1" style="max-height: 600px">
                <img
                  src="./assets/images/pngegg7.png"
                  class="card-img-top"
                  alt="..."
                  style="width: 100%; margin-top: 6px"
                />
                <div class="card-body">
                  <h5 class="card-title">Advanced</h5>
                  <p class="card-text text-white">
                 Master complex skills, fine-tune your expertise, and strive for excellence in all you do.
                  </p>
                  <a href="quiz.jsp?levelid=3" class="btn btn-outline-light"
                    >Let's Get It <i class="fas fa-arrow-alt-circle-right"></i
                  ></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section
      id="details"
      class="details position-relative my-6 overflow-hidden"
    >
     
      <div class="container position-relative z-3">
        <div class="row">
          <div class="col-lg-6">
            <div class="image-container d-flex justify-content-center">
              <img src="./assets/images/header1.png" alt="" class="img-fluid" />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="mt-4">
              <h2 class="mb-4">
                Brain Power <span class="text-danger">Challenge</span> 
              </h2>
              <ul class="list-unstyled">
                <li class="d-flex mb-3">
                  <i
                    class="fas fa-check text-primary fa-2x mx-4 text-primary"
                  ></i>
                  <p>
                   Get ready to challenge your brain with questions on Math, English, and Myanmar general knowledge.It time to show off your skills, learn new things, and have fun along the way.Let's see how many questions you can get right!
                  </p>
                </li>
                <li class="d-flex mb-3">
                  <i class="fas fa-check text-success fa-2x mx-4"></i>
                  <p>
                    Enhance your problem-solving skills as you tackle math puzzles and challenges, improving your arithmetic and logical thinking.
                  </p>
                </li>
                <li class="d-flex mb-3">
                  <i class="fas fa-check text-warning fa-2x mx-4"></i>
                  <p>
                    Boost your English language abilities by practicing vocabulary, grammar, and comprehension in an engaging way.
                  </p>
                </li>
                <li class="d-flex mb-3">
                  <i class="fas fa-check text-danger fa-2x mx-4"></i>
                  <p>
                   Expand your knowledge of Myanmar by exploring fun facts about its history, geography, and culture, enriching your understanding of the country.
                  </p>
                </li>
              </ul>
              <a href="#classes" class="btn btn-primary">Get Started</a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Introduction -->
    <section id="introduction" class="intro bg-light py-6 mt-7">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <h2>
              Creating <span class="text-secondary">Inspiring</span> Kid's
              Spaces
            </h2>
            <p class="fs-5">
              Transform your child's learning environment with our engaging quiz website! By using fun questions on Math, English, and Myanmar general knowledge, you create a stimulating space where kids can enhance their problem-solving skills, boost their language abilities, and expand their knowledge. It's an interactive way to inspire curiosity and make learning exciting!
            </p>
          </div>
        </div>
      </div>
    </section>

 
 

   
  

    <!-- Services -->
    <section id="services" class="services py-6">
      <div class="container">
        <div class="row">
          <div class="col-lg-5">
            <div class="text-container text-center text-lg-start">
              <h2><span class="text-danger">Services</span> that we offer</h2>
              <p>
                At our company, we provide a wide range of services to meet all
                your office design needs. With our expertise and attention to
                detail, we ensure that every aspect of your office space is
                carefully considered and executed.
              </p>
            </div>
          </div>
          <div class="col-lg-7">
            <div class="row mb-4">
              <div
                class="col-md-4 d-flex flex-column align-items-center text-center"
              >
                <i class="fas fa-book fa-4x text-primary mb-2"></i>
                <p class="fs-5 fw-bold">Knowledge & Thinking</p>
              </div>
              <div
                class="col-md-4 d-flex flex-column align-items-center text-center"
              >
                <i class="fas fa-clock fa-4x text-secondary mb-2"></i>
                <p class="fs-5 fw-bold">Design & Color Choosing</p>
              </div>
              <div
                class="col-md-4 d-flex flex-column align-items-center text-center"
              >
                <i class="fas fa-comments fa-4x text-warning mb-2"></i>
                <p class="fs-5 fw-bold">Materials & Delivery</p>
              </div>
            </div>
            <div class="row">
              <div
                class="col-md-4 d-flex flex-column align-items-center text-center"
              >
                <i class="fas fa-brain fa-4x text-danger mb-2"></i>
                <p class="fs-5 fw-bold">Critical Thinking & Creativity</p>
              </div>
              <div
                class="col-md-4 d-flex flex-column align-items-center text-center"
              >
                <i class="fas fa-chart-pie fa-4x text-success mb-2"></i>
                <p class="fs-5 fw-bold">Create A Great Decission</p>
              </div>
              <div
                class="col-md-4 d-flex flex-column align-items-center text-center"
              >
                <i class="fas fa-chart-bar fa-4x text-dark mb-2"></i>
                <p class="fs-5 fw-bold">Evaluation & Reporting</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 
    <section id="testimonials" class="testimonials bg-light py-6">
      <div id="testimonialCarousel" class="carousel slide">
        <div class="carousel-inner">
          Slide 1
          <div class="carousel-item active">
            <div
              class="d-flex flex-column justify-content-center align-items-center text-center"
            >
              <img
                src="./assets/images/testimonial-1.jpg"
                alt=""
                class="rounded-circle"
                width="120"
              />
              <p class="w-50 my-4 fst-italic fs-4 mb-4">
                Ã¢ÂÂExpense bed any sister depend changer off piqued one. Contented
                continued any happiness instantly objection yet her allowance.
                Use correct day new brought tedious. By come this been in. Kept
                easy or sons my it how about some words here doneÃ¢ÂÂ
              </p>
              <div class="fw-bold fs-5 mt-4">Marlene Visconte</div>
              <div>General Manager - Scouter</div>
            </div>
          </div>

          Slide 2
          <div class="carousel-item">
            <div
              class="d-flex flex-column justify-content-center align-items-center text-center"
            >
              <img
                src="./assets/images/testimonial-1.jpg"
                alt=""
                class="rounded-circle"
                width="120"
              />
              <p class="w-50 my-4 fst-italic fs-4 mb-4">
                Ã¢ÂÂExpense bed any sister depend changer off piqued one. Contented
                continued any happiness instantly objection yet her allowance.
                Use correct day new brought tedious. By come this been in. Kept
                easy or sons my it how about some words here doneÃ¢ÂÂ
              </p>
              <div class="fw-bold fs-5 mt-4">John Spiker</div>
              <div>Team Leader - Vanquish</div>
            </div>
          </div>
          Slide 1
          <div class="carousel-item">
            <div
              class="d-flex flex-column justify-content-center align-items-center text-center"
            >
              <img
                src="./assets/images/testimonial-2.jpg"
                alt=""
                class="rounded-circle"
                width="120"
              />
              <p class="w-50 my-4 fst-italic fs-4 mb-4">
                Ã¢ÂÂExpense bed any sister depend changer off piqued one. Contented
                continued any happiness instantly objection yet her allowance.
                Use correct day new brought tedious. By come this been in. Kept
                easy or sons my it how about some words here doneÃ¢ÂÂ
              </p>
              <div class="fw-bold fs-5 mt-4">Stella Virtuoso</div>
              <div>Design Chief - Bikegirl</div>
            </div>
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#testimonialCarousel"
          data-bs-slide="prev"
        >
          <i class="fas fa-arrow-circle-left fa-3x text-secondary"></i>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#testimonialCarousel"
          data-bs-slide="next"
        >
          <i class="fas fa-arrow-circle-right fa-3x text-secondary"></i>
        </button>
      </div>
    </section> -->

    <!-- Contact -->
    <section id="contact" class="contact my-6 position-relative">
     

      <div class="container position-relative z-3">
        <div class="row">
          <div class="col-lg-6 d-none d-md-block">
            <div class="image-container">
              <img
                src="./assets/images/pngegg2.png"
                alt=""
                class="img-fluid"
                style="height: 600px"
              />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="text-container">
              <h2>Contact Us For A Quote</h2>

              <form>
                <div class="mb-3">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Enter name"
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="email"
                    class="form-control"
                    placeholder="Enter email"
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Enter phone"
                  />
                </div>
                <div class="mb-3">
                  <textarea
                    class="form-control"
                    placeholder="Enter message"
                    rows="8"
                  ></textarea>
                </div>
                <div class="d-grid gap-2">
                  <input
                    type="submit"
                    value="Send"
                    class="btn btn-primary btn-block"
                  />
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>

<%@ include file="assets/layout/footer.jsp"%>