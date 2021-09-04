import React, { Component } from "react"
import { Link } from "react-router-dom"
import JobCard from "../../components/JobCard"

class JobsIndex extends Component {
  render() {
    const { jobs, buckets, statuses, logged_in, deleteJob } = this.props
    console.log("index delete: ", deleteJob)
    return (
      <div>
        <h1 className="page-header">Job Board</h1>

        <div className="board grid grid-cols-4 gap-1 mt-2">
          {statuses &&
            statuses
              .filter((s) => {
                return s.priority
              })
              .map((status) => {
                return (
                  <div key={status.id}>
                    <h3
                      className={`priority-${status.priority} text-center text-lg`}
                    >
                      {status.name}
                    </h3>

                    {buckets[status.name] &&
                      buckets[status.name].map((job) => {
                        return (
                          <JobCard
                            key={job.id}
                            job={job}
                            logged_in={logged_in}
                            deleteJob={deleteJob}
                          />
                        )
                      })}
                  </div>
                )
              })}

          {/* {jobs &&
            jobs.map((j) => {
              return <JobCard key={j.id} job={j} />
            })} */}
        </div>
        <Link className="button yellow" to="/jobsnew">
          New Job listing
        </Link>
      </div>
    )
  }
}

export default JobsIndex
